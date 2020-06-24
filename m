Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1BF20966F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2020 00:36:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1joE0D-00068O-Sm; Wed, 24 Jun 2020 22:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <didier@slint.fr>) id 1joE0C-00067s-Hd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 22:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FLKIjClgrJ5Y54XASWKY45OMA2iqTm3odNz4huJ2AC4=; b=j4/ntlyEDnDNIdTqbzdxaZIRH6
 7VjkMUt8mkyExczeii4d+JDO4u+VES0B44ElAmQBh1Dexdyl3IIeQ0cxiSw7qho5ND7ggJzdacb+2
 JuTcsByDDhprDSiiQTgZjx9v7gEYsUzEsLoQMg9MT25VAE3l4efq9/Rxlor/ew4KsVqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FLKIjClgrJ5Y54XASWKY45OMA2iqTm3odNz4huJ2AC4=; b=T
 RhruWWkONVeWEMoXFho3Z57NWrYPqSzG7jlW52K2fzZ29mKa0tQ88ukyWJ9bqmnV+LJDuDV7UDXXf
 93DzuwQzaG6AQbl23mfCiPl/IEADtPmHbQuiSSM5Qa2+4cuHFrLf/qwBCoI8gQ1DtDEyTZAmSeaqu
 wrsJ9GznvFAqHgDM=;
Received: from darkstar.slint.fr ([172.105.89.79])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1joE09-00HPLx-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 22:36:20 +0000
Received: from darkstar.slint.fr
 (men75-h08-176-172-247-100.dsl.sta.abo.bbox.fr [176.172.247.100])
 by darkstar.slint.fr (Postfix) with ESMTPSA id 3FB4EBE7DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jun 2020 23:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=slint.fr; s=default;
 t=1593033446; bh=PpSlgE5thHMGXuXNYT3X4vKjU61GJG+aEmZ2gPB2AQ0=;
 h=To:From:Subject:Date:From;
 b=WqNTmGqzpaJsh0/8v8VeWtAVYhN959fCe9teHFmeXj6QI5cwk40IKZORV6YzD7ny1
 ICDG0kKu6oUfpteLUy84UYfbbcSnfq6RG8q1ltfn81h3nMixrGgNldH8GjsEVUBOfb
 chFLh8sJwGRWHd6pHPWIOx6MDs3hA3yhcQMLTogr1TlPsty+Lp0YMw5wxQ9mqaPgmK
 VBngzoObAji4xc+KXv57rowyJ/nyRwAaK/+w+BDbAKjOIcavZ+Dw4/3Kx9CdgtjTuj
 iHJHidRwtbl0KKBo3I07Zpx80UxUHtmwmkAg8hQumXeNBtsO6Em4gV3QcsPvLTf+PZ
 oM2xShPw/ZXTQ==
To: linux-f2fs-devel@lists.sourceforge.net
From: Didier Spaier <didier@slint.fr>
Autocrypt: addr=didier@slint.fr; prefer-encrypt=mutual; keydata=
 xsBNBFY6fG8BCADH4Hf/OaE2MwXRFMrU/9oDd+YPqR/wkhmIv0veDio84fsWA5qMz1De7TEv
 dNuxIVYTznuVOd/9lpdfxQ1KV9rgD7yoBPLmjbQA1vVjB+1QylIQUV0B9AYFUsxZP32Ic2pg
 TS3US/WiZyx+/jS50ri4kvT9iDtIEu7WBWFr8YMOoq3oLkHI8Y7gBG0WsK9XYN09glhtI+bA
 jLPr/ezwEg5M3FDb4U7XFq7GcA6EEzanKMAOHdZl3lta7dv5gpgdj+38j5jPfV1cJW+J1fha
 63X72xxXGs7V6J7NGpnW7SAKfTAMXsPXZwwGIuqMQs1Z89I+2ZPJPOoV8zMncTsWzHStABEB
 AAHNH0RpZGllciBTcGFpZXIgPGRpZGllckBzbGludC5mcj7CwH8EEwEKACkCGwMHCwkIBwMC
 AQYVCAIJCgsEFgIDAQIeAQIXgAUCXcBjnwUJGlHqEgAKCRDVAgLvYMA+6v/ICAC8Oa2zXOne
 zyuFrPtNsciJWYwWamW+g5TNaY9NPnyMRNKDi7IcP6PoDwHRI8YBgo+Z9w0qFKQ/WVSI/O6s
 gm7LnOX7OEHjnub4sjrr5PHcsPRjm6iJFIgGgD+waz0K5fxcc65ti3lgHLH1tkhORyiT5EFp
 0VllWDQfPHw5avm9oopJv1FuPfZhSlFT6QhjD2ARmOrxfFBjELQZjDidckOYf/8Stoh+aK5F
 5q69DpF+bSZzOtCht+S6LT+Im5zqMgq1Dfqb3FpnVO3MyhSLeGI2nB+OFNTBGByRFKHYRsHc
 VaQBjtfsr4HnC0UR2P/bDIk/oxLnIN9nHJuL6btcf9M6zsBNBFY6fG8BCACqDQKHSw0ElDkw
 PPpNguL0ujOyygO30xlLyfW9pWOEycHSLhLzvDTlFkvr5IxvyCDBIFBdzpkeQqh1+ZxrFliw
 Wyj+9/roJlIjxeAyNs2xQZ7tQM6K5xtbUs8O5YtkCCO3OegAiLgmzzgxes79Qy+V3ciKbl+v
 rsNu7T9ro3zZhyinci1eOCcKEtXFPQW5P4woB+6+JheN9pIiDkjojmdC+xkvDadP7kJYKp19
 Itys/CbNvxEoOLsgeJhsZSmNU2QNhXkLfr7+AC99fb/c5ZDTNPRBqgLJCp+gTxn1QVJrAbq2
 OP3refmSRxdA3yUDMjxEeHwDNZJL9aEtTDlTzPk5ABEBAAHCwGUEGAEKAA8CGwwFAl1EQo4F
 CQjq+XYACgkQ1QIC72DAPurGhAf+LKNM5AajZNNnccq3bWawqsY1P5ZtFvZLPxMbx2xsnYaM
 8UPe/tGfuxp+q1ouCRKgvtefjd2eBLGXaysCA5r3Jv+hgdjPKEJut3rARhTJMaDwjKOcOTHG
 AhFtpsjBkVXuCBxEpNBEypyis3w4kQUCxP7nro4yzdXY7s6EbadNd8nG4B8qFt4JxnqJnZWl
 97mBQFJjFXlkAM+0eAkpF+rYzL6QKCKydO2Xcz7UTSMe/blXtZUjHxyr8Nh1G+ywEbkmQP+l
 QhcxJYJbK+q4zNM0U64zzLRwIvVknpdEzJKiFXsydnm9VFE9tzC6a+h40du2OdhkoNDVuFSq
 aG2M5OmN/Q==
Message-ID: <13e19af7-69d5-6db3-441e-3be4921983de@slint.fr>
Date: Thu, 25 Jun 2020 00:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1joE09-00HPLx-Aw
Subject: [f2fs-dev] Questions about using f2fs to format the root partition
 during Slint installation.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello list,

this email is a follow-up of:
https://www.mail-archive.com/linux-f2fs-devel@lists.sourceforge.net/msg14390.html

I will number the questions Q1, Q2 etc.

To summarize the context and goal: I want that the Slint installer
format the root partition with f2fs when appropriate, if possible
without asking questions to the user about the device.

I target usage of f2fs for the root file system in cases of USB flash
drives aka USB sticks, SD cards, eMMC, as if I understand correctly
these kinds of devices benefit the most of wear minimization and
increase of performance when using f2fs. I plan to use ext4 for SSD
(including NVMe) and hard disks.

This leads to several questions:

Q1: Comments about this choice of target devices for f2fs, knowing that
I favor security over performances and that the "auto" option of the
installer is intended for your grand-mother? I am a grand father myself
<smile>.

Q2. How-to determine if the drive fall in one of the types listed above
without asking the user if possible?

I have considered using the output of lsblk and/or "udevadm info" but
that doesn't seem to provide enough information on the device.

As an aside, I have seen rota=1 for an USB boot stick. ??? 

Q3. What would be the safest options to include in the relevant line of
/etc/fstab forthe root partition using f2fs?

Q4. do you confirm the statement below? it is a quote of web page:
https://wiki.gentoo.org/wiki/F2FS
> When using f2fs > When using f2fs as rootfs fsck fails on boot.
> Solutions are either disabling fsck in /etc/fstab (setting the last
> number to 0) or enabling the force-flag for fsck in /etc/conf.d/fsck.
> See bug #671786

Q5. I am correct f2fs can be expanded but not shrinked. Is it still
true? Will it planned to bring this feature?

Q6. Currently we ship a 4.19 kernel. Would it be preferable to ship a
5.4 one instead shipped in Slackware-current at time of writing, knowing
that we ship an no patched (aka vanilla) kernel and what would be the
benefit of doing so wrt f2fs?

Have a good day,

Didier



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
