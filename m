Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB08137AC2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jan 2020 01:49:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iq4xk-0004bu-CH; Sat, 11 Jan 2020 00:49:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iq4xj-0004bg-1m
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 00:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fL+jpi61rk7LDRMH/eWtLLuDjd9z3bxFc59xFpvg0S4=; b=hNrxTGi30XZ7M5yjwp4oki/XrO
 W53Lpn2FlCUYosnUX6iaA1rMhJOx9WJ5JjfWMYeKcw7CKk/jtpPb8uPuKltGscJK80lTejAXTJQWb
 2RMLzd6wMTc6eACzKsWJUn4Sro5nD6uu0Z4I+XfM8MH1lb5RYQ0b2Su+UX/5roH30350=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fL+jpi61rk7LDRMH/eWtLLuDjd9z3bxFc59xFpvg0S4=; b=TEAOePJdM67EOYqherzGzee5g+
 IW2XGWJuyGOa4PvcWOEDSSPRqx5/XjaGrDvUDbZMPesuEOHxnXGwTzuV0smyJwVP3bvlhbiuoct/N
 MoNhyZhVARNpSEvq5N3xf7U/DVRFvDux6sym/GXelP57mWwer0V0Zc9I97XdGBykWT0M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iq4xd-00HWC5-DP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 00:49:10 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC3A424649;
 Sat, 11 Jan 2020 00:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578703739;
 bh=3kZ1iuWEqVVyEqOBdLPjD3O6skFoOheCA4Q0UzPwbIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGb2ttnIdOqF8wCoJ2KzHBp8GNx5FxGIL3w/4ubgFyJkbQpTAhqe/oy2dd6vSnO6M
 7vF5eYm6ghjpfRFx0460nQbQyVPxa0r63UZdaJkCOVEFhqMTbc/KH1Sbax5Ey4tU/5
 Gl8h7retz2eDoC7xWXQGEFnFZQ1fD5lYz3EfARjQ=
Date: Fri, 10 Jan 2020 16:48:58 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
Message-ID: <20200111004858.GB25700@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200108182655.GA10257@lazy.lzy>
 <20200109022930.GC42219@jaegeuk-macbookpro.roam.corp.google.com>
 <20200109173753.GA4863@lazy.lzy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109173753.GA4863@lazy.lzy>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iq4xd-00HWC5-DP
Subject: Re: [f2fs-dev] TRIM issue
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/09, Piergiorgio Sartor wrote:
> Hi,
> 
> thanks for the reply, please see my comments
> embedded below.
> 
> On Wed, Jan 08, 2020 at 06:29:30PM -0800, Jaegeuk Kim wrote:
> > Hi,
> > 
> > On 01/08, Piergiorgio Sartor wrote:
> > > Hi all,
> > > 
> > > I've a small box, with Fedora 31 up-to-date.
> > > 
> > > The system has LUKS + LVM + f2fs.
> > > 
> > > Since kernel 5.3.16-300.fc31.x86_64 the fstrim.service,
> > > triggered by the systemd service fstrim.timer or from
> > > command line, does return an error:
> > > 
> > > Starting Discard unused blocks on filesystems from /etc/fstab...
> > > fstrim: /home: FITRIM ioctl failed: Read-only file system
> > > fstrim: /: FITRIM ioctl failed: Read-only file system
> > > fstrim.service: Main process exited, code=exited, status=32/n/a
> > > fstrim.service: Failed with result 'exit-code'.
> > > Failed to start Discard unused blocks on filesystems from /etc/fstab.
> > 
> > It smells like trying fstrim along with /etc/fstab before mounting the
> > partitions?
> 
> The error is reported also when running, as root,
> the command "systemctl start fstrim.service" from
> command line, that is with partitions available.
> So, I do not think it is before mounting. Also,
> this is usually started weekly from fstrim.timer,
> and this requires a running system.
> It could be a strange conflict with systemd, but
> with ext4 there is no problem, it happens with f2fs.

Okay.

> 
> > > Note the following:
> > > 1) Both /home and / are rw
> > > 2) LUKS and LVM allow discard to the underlying device
> > > 3) An other PC, with same layout, but ext4, does work as expected
> > > 4) kernel 5.4.7-200.fc31.x86_64 (latest for f31) has same result
> > > 5) fstrim -vA or -va does not return an error, exit code is 0,
> > > but it always says 0 (zero) bytes are trimmed:
> > > 
> > > /home: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-home
> > > /: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-root
> > 
> > This is normal. Since f2fs issues discard commands asynchronously, fstrim
> > just collects discard candidates and returns right away. Later, it will
> > actually issue the candidates in background. Whereas, if it was mounted as
> > "-o nodiscard", fstrim will wait for whole discard commands being issued
> > and completed as you expect.
> 
> OK, I remounted / with "nodiscard", created a 1GB
> file, synched the fs, deleted the file and issued
> "fstrim -vA".
> I can confirm 1GB was trimmed, more precisely 1.1GB
> according to "fstrim".
> 
> I repeated the test, but instead using "systemctl
> start fstrim.service".
> Same error as before.
> But, a succesive "fstrim -vA" returned only 2.7MB
> trimmed.
> This could be that the "fstrim" call was executed
> properly, but some error report was triggered.
> Maybe the read-only file system is not correct,
> but something happened.
> I would like to stress again that ext4 does not
> trigger this error.
> 
> So, there is something related with f2fs, at
> least with the interaction with fstrim and
> systemd.

I'm not sure, maybe systemd interpreted zero return as RO partition?

> 
> I have one question.
> 
> Since f2fs is mounted with "discard" and, as I
> understand it, f2fs will issue discard as soon
> as a segment is freed, is it relevant to have
> the weekly fstrim from systemd?

Not exactly segment. f2fs supports small sized discards as well in order to
get better performance of small crappy mmc cards.

The return value of fstrim in f2fs represents the actual size of discard
commands being issued during the syscall. So, fstrim w/ "-o discard" gives zero
all the time. OTOH, it reports non-zero value given "-o nodiscard", but again
won't give the full size all the time, since f2fs doesn't issue discard commands
onto previously discarded space.

So, in general, I prefer managing this like in Android [1] with "-o discard" and
1) run f2fs GC/discard w/ "-o discard" aggressively at night, 2) run fstrim
instantly, 3) sync.

1) can be simply done by:
- "echo 1 > /sys/fs/f2fs/dev/gc_urgent" 
- wait for 10 minutres
- "echo 0 > /sys/fs/f2fs/dev/gc_urgent"
- sync

[1] https://android.googlesource.com/platform/system/vold/+/91a68dfc98defe4de8630290b0dcff0311de6678/IdleMaint.cpp#71

> 
> Thanks a lot in advance,
> 
> bye,
> 
> pg
> 
> > 
> > Thanks,
> > 
> > > 
> > > 6) mount shows that the f2fs mounts have "discard" flag
> > > 
> > > So, I suspect there is something with f2fs which somehow
> > > confuses the trimming process.
> > > 
> > > I had a quick search, but I could not find any other
> > > similar report, except one about systemd, but that
> > > does not seem related.
> > > 
> > > Any idea? Suggestions?
> > > Debugging possibilities?
> > > 
> > > Thanks a lot in advance,
> > > 
> > > bye,
> > > 
> > > -- 
> > > 
> > > piergiorgio
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> -- 
> 
> piergiorgio
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
