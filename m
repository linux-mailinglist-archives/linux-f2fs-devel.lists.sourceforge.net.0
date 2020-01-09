Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B2135F6F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 18:38:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipblC-00065o-6O; Thu, 09 Jan 2020 17:38:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <piergiorgio.sartor@nexgo.de>) id 1ipbl6-00065Z-UR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 17:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRlLrBW4mfUcto/ZIbY3uFhEU6cJLSgaLIlqIDTtE2Y=; b=NSm1T7gxZ8Ikhy5UjglgJrIH2e
 BNitQeArDDkYG3tDlviW4CkqJWed0mE1XkOM2/ti0uF5al2DzEJOhYWEeS8TDwNbI8ApaIiwVU2w5
 FWh2frmfSh9ReNm8J4Z5xhS5+c788mPwc8W82dIwi/6QRQn+4l2+yEzbxtJ2CoofZuig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WRlLrBW4mfUcto/ZIbY3uFhEU6cJLSgaLIlqIDTtE2Y=; b=ccmGwPcKtRM7PLBUXEJmvoMOuW
 BRzp9ElDU//cnk16m/lRAOPPsiFS9YKKyNrOaIkf4ngD23X5ZewlbgTbK8XXCCIZ9AU+H0i+ue3N5
 CpVahAymdC2sEWrgxdYXWdhhFitHDtQthCXnQxUftsrnTj17zxHe/Ea44nN3vuZa9wjU=;
Received: from vsmx009.vodafonemail.xion.oxcs.net ([153.92.174.87])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipbl4-00EjhM-DZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 17:38:12 +0000
Received: from vsmx001.vodafonemail.xion.oxcs.net (unknown [192.168.75.191])
 by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 2B76A159D0EE;
 Thu,  9 Jan 2020 17:38:02 +0000 (UTC)
Received: from lazy.lzy (unknown [79.214.221.251])
 by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 83C7E159CF77;
 Thu,  9 Jan 2020 17:37:55 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
 by lazy.lzy (8.15.2/8.14.5) with ESMTPS id 009HbrJH005100
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 9 Jan 2020 18:37:53 +0100
Received: (from red@localhost)
 by lazy.lzy (8.15.2/8.15.2/Submit) id 009HbroQ005099;
 Thu, 9 Jan 2020 18:37:53 +0100
Date: Thu, 9 Jan 2020 18:37:53 +0100
From: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200109173753.GA4863@lazy.lzy>
References: <20200108182655.GA10257@lazy.lzy>
 <20200109022930.GC42219@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109022930.GC42219@jaegeuk-macbookpro.roam.corp.google.com>
X-VADE-STATUS: LEGIT
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ipbl4-00EjhM-DZ
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
Cc: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

thanks for the reply, please see my comments
embedded below.

On Wed, Jan 08, 2020 at 06:29:30PM -0800, Jaegeuk Kim wrote:
> Hi,
> 
> On 01/08, Piergiorgio Sartor wrote:
> > Hi all,
> > 
> > I've a small box, with Fedora 31 up-to-date.
> > 
> > The system has LUKS + LVM + f2fs.
> > 
> > Since kernel 5.3.16-300.fc31.x86_64 the fstrim.service,
> > triggered by the systemd service fstrim.timer or from
> > command line, does return an error:
> > 
> > Starting Discard unused blocks on filesystems from /etc/fstab...
> > fstrim: /home: FITRIM ioctl failed: Read-only file system
> > fstrim: /: FITRIM ioctl failed: Read-only file system
> > fstrim.service: Main process exited, code=exited, status=32/n/a
> > fstrim.service: Failed with result 'exit-code'.
> > Failed to start Discard unused blocks on filesystems from /etc/fstab.
> 
> It smells like trying fstrim along with /etc/fstab before mounting the
> partitions?

The error is reported also when running, as root,
the command "systemctl start fstrim.service" from
command line, that is with partitions available.
So, I do not think it is before mounting. Also,
this is usually started weekly from fstrim.timer,
and this requires a running system.
It could be a strange conflict with systemd, but
with ext4 there is no problem, it happens with f2fs.

> > Note the following:
> > 1) Both /home and / are rw
> > 2) LUKS and LVM allow discard to the underlying device
> > 3) An other PC, with same layout, but ext4, does work as expected
> > 4) kernel 5.4.7-200.fc31.x86_64 (latest for f31) has same result
> > 5) fstrim -vA or -va does not return an error, exit code is 0,
> > but it always says 0 (zero) bytes are trimmed:
> > 
> > /home: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-home
> > /: 0 B (0 bytes) trimmed on /dev/mapper/fedora--server-root
> 
> This is normal. Since f2fs issues discard commands asynchronously, fstrim
> just collects discard candidates and returns right away. Later, it will
> actually issue the candidates in background. Whereas, if it was mounted as
> "-o nodiscard", fstrim will wait for whole discard commands being issued
> and completed as you expect.

OK, I remounted / with "nodiscard", created a 1GB
file, synched the fs, deleted the file and issued
"fstrim -vA".
I can confirm 1GB was trimmed, more precisely 1.1GB
according to "fstrim".

I repeated the test, but instead using "systemctl
start fstrim.service".
Same error as before.
But, a succesive "fstrim -vA" returned only 2.7MB
trimmed.
This could be that the "fstrim" call was executed
properly, but some error report was triggered.
Maybe the read-only file system is not correct,
but something happened.
I would like to stress again that ext4 does not
trigger this error.

So, there is something related with f2fs, at
least with the interaction with fstrim and
systemd.

I have one question.

Since f2fs is mounted with "discard" and, as I
understand it, f2fs will issue discard as soon
as a segment is freed, is it relevant to have
the weekly fstrim from systemd?

Thanks a lot in advance,

bye,

pg

> 
> Thanks,
> 
> > 
> > 6) mount shows that the f2fs mounts have "discard" flag
> > 
> > So, I suspect there is something with f2fs which somehow
> > confuses the trimming process.
> > 
> > I had a quick search, but I could not find any other
> > similar report, except one about systemd, but that
> > does not seem related.
> > 
> > Any idea? Suggestions?
> > Debugging possibilities?
> > 
> > Thanks a lot in advance,
> > 
> > bye,
> > 
> > -- 
> > 
> > piergiorgio
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

-- 

piergiorgio


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
