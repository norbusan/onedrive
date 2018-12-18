import std.concurrency, std.stdio;

private void indicatorFunction()
{
	for (;;) {
		auto msg = receiveOnly!(Tid, string)();
		writeln("Indicator received: ", msg[1]);
	}
}

final class Indicator
{
	private Tid indicatorThreadId;

	this()
	{
	}

	void start()
	{
		this.indicatorThreadId = spawn(&indicatorFunction);
	}

	void stop()
	{
		// TODO
	}

	void send(Tid senderTid, string msg)
	{
		this.indicatorThreadId.send(senderTid, msg);
	}

}
