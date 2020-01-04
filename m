Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C491304C6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Jan 2020 22:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:References:In-Reply-To:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KexO7ELr7JZfOXnHFI21HFw207Tzqnz3SUtK2egzcUA=; b=I42dM8+RKN649Vn5XxiXXTWm0o
	aqb6ZWN0Itc3rvhKn+H193e7aOuzB0sRkoWLr6bJ69xlfQDc+IaCIsVVACVV6mgTiRuTcyUS7Ah0V
	6JTh/0H8osrkNSoMgArSYH/FBq1PSXyBEV0E3zjiXu0ChyrjJHbIHGlIq4RvVAa7ekaw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inrMA-0003qm-KL; Sat, 04 Jan 2020 21:53:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oleksandr@natalenko.name>) id 1inrM8-0003qO-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 21:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8kF02N3UgQmy+M1+yfJ0I6y3z6Y1C+QkxFReEl2674=; b=IPgYKfkDHyqjyv8bNTZ4l4ttE4
 743H5LzIQGFso0QxFHU8WwkwkqazfAvQ3MzmLRjocxc5dzUGTrJg9+VKGoGCtI13RvWX1ENn02OSj
 jAnZgPUx8YDOa4IiSX2bvYgbm5jYZzbh/op1pk/ZgT6gXID0UfNoRLCalXaUwddbXwa0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8kF02N3UgQmy+M1+yfJ0I6y3z6Y1C+QkxFReEl2674=; b=cIXV7cXyojhgSfzxDKk3XaUr3e
 /aZ7utczBRB7+/xqlpAm9z7Pa+i8TiNFKAC5J1HDNRAmcJoQyRpYpULvf1M76ZByqtxXrRUa8Jrse
 SheSNHKuom1Lmsvl9hKzl1yzaW7bh4yZLJpbv4a3nZqY1p33y6pSJrQEUnpVK8t6a07A=;
Received: from [104.207.131.136] (helo=vulcan.natalenko.name)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inrM0-009rwo-Dg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Jan 2020 21:53:11 +0000
Received: from mail.natalenko.name (vulcan.natalenko.name
 [IPv6:fe80::5400:ff:fe0c:dfa0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id B399E67EB38;
 Sat,  4 Jan 2020 22:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1578174768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8kF02N3UgQmy+M1+yfJ0I6y3z6Y1C+QkxFReEl2674=;
 b=GFNOZfPmGwsVS7Lu1EiBphG1JX+AG9AGuAp80b0BOmfehEGCwtDhFkzBKLzoLIuRwYwVUo
 7yk63AU35oNKiI+qp62YNbWfkA0b7hoO7aIGj4PruQAsQ7fpWcM03Khl5Ew2ASAZIl0HoY
 xJszXGq1M10QUMvkakjs14dtGuAWUhI=
MIME-Version: 1.0
Date: Sat, 04 Jan 2020 22:52:48 +0100
To: linux-f2fs-devel@lists.sourceforge.net
In-Reply-To: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <2c4cafd35d1595a62134203669d7c244@natalenko.name>
X-Sender: oleksandr@natalenko.name
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inrM0-009rwo-Dg
Subject: Re: [f2fs-dev] Multidevice f2fs mount after disk rearrangement
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
From: Oleksandr Natalenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi.

On 04.01.2020 17:29, Oleksandr Natalenko wrote:
> I was brave enough to create f2fs filesystem spanning through 2
> physical device using this command:
> 
> # mkfs.f2fs -t 0 /dev/sdc -c /dev/sdd
> 
> It worked fine until I removed /dev/sdb from my system, so f2fs devices 
> became:
> 
> /dev/sdc -> /dev/sdb
> /dev/sdd -> /dev/sdc
> 
> Now, when I try to mount it, I get the following:
> 
> # mount -t f2fs /dev/sdb /mnt/fs
> mount: /mnt/fs: mount(2) system call failed: No such file or directory.
> 
> In dmesg:
> 
> [Jan 4 17:25] F2FS-fs (sdb): Mount Device [ 0]:             /dev/sdc,
>   59063,        0 -  1cd6fff
> [  +0,000024] F2FS-fs (sdb): Failed to find devices
> 
> fsck also fails with the following assertion:
> 
> [ASSERT] (init_sb_info: 908) !strcmp((char *)sb->devs[i].path, (char
> *)c.devices[i].path)
> 
> Am I doing something obviously stupid, and the device path can be
> (somehow) changed so that the mount succeeds, or this is unfixable,
> and f2fs relies on persistent device naming?
> 
> Please suggest.
> 
> Thank you.

Erm, fine. I studied f2fs-tools code a little bit and discovered that 
superblock indeed had /dev/sdX paths saved as strings. So I fired up 
hexedit and just changed the superblock directly on the first device, 
substituting sdc with sdb and sdd with sdc (I did it twice; I guess 
there are 2 copies of superblock), and after this the mount worked.

Am I really supposed to do this manually ;)?

-- 
   Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
