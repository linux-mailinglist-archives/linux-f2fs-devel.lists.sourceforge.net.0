Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BCD1317A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 19:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:References:In-Reply-To:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li/DjvsgRi1VQlH7lCnoYV0gBAoxo+clhXD4vAFt1Z8=; b=YSg+pNwxBXeHbcOqaRALCM85v5
	GENIFx+YYNi8MSZA0HWmI2bspvbYahBHCf2tWzkzKBmAh4hvsbCBmvuN/85jtxRdZdTPBo8O37QAk
	SSs4ou1D1QDRWuJh3Ox1MnkcdoFiB8sAl7Q7PCpdCtFrOpEoq08Uk/ODH7a4twbe5QEM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioXJd-0006Y4-3R; Mon, 06 Jan 2020 18:41:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oleksandr@natalenko.name>) id 1ioXJb-0006Xu-6P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rp8CUrnWGAoX8TC2iOuIG764rbPn2mqZv/jvq2or5Tk=; b=ZULtkGRNYSZnS/SBpbVw3r8FME
 JUR55nrQcSymM+Mm8yZ0TSf/bioqPiJ/zeHy0cXmwa7GGwkoaor6CQYk2aI29ec7rM+hUCK4ay4br
 +bdbSUK/Rqsa3CJpAmMIAhvANpKv3uuEg/RNwUlnmF/kV4Zo+9tXEF0wuU69VAVqW1P8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rp8CUrnWGAoX8TC2iOuIG764rbPn2mqZv/jvq2or5Tk=; b=hMxVTuEhXXXs/vgAL1gk2+/lDd
 cfv+twjMgg04xM8oh31aiG+T/dLmH80tBSMKgvY5/S7uiEzRs9g3GR3GOI9dhM/ZJ+g7nE3rN0cSl
 4X73qk+y4N77z7KYer8IoVp+JT16xXlMOGQeW+9UlPvcVyCXFeGgaiA6kbWFXA7cVOCs=;
Received: from vulcan.natalenko.name ([104.207.131.136])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioXJN-00Bpxx-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:41:23 +0000
Received: from mail.natalenko.name (vulcan.natalenko.name
 [IPv6:fe80::5400:ff:fe0c:dfa0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 7F188683B63;
 Mon,  6 Jan 2020 19:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1578336055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rp8CUrnWGAoX8TC2iOuIG764rbPn2mqZv/jvq2or5Tk=;
 b=IjaLXYIRwuSSDDoP3AEQkfXkT3M26EZ/9Lfh+wD7HcqyriyPvB5UuIPxmJ7a2JCitX5e1+
 GFvUj6Xs95xNou34pU8rzc0T6QijPfQ/KyFAkdxDXlCrdtswZMRz8caBzjUWzGMO34qRMK
 CZuYApNwruZvaodV0MuczD4YHq4f/t0=
MIME-Version: 1.0
Date: Mon, 06 Jan 2020 19:40:55 +0100
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20200106183450.GC50058@jaegeuk-macbookpro.roam.corp.google.com>
References: <4c6cf8418236145f7124ac61eb2908ad@natalenko.name>
 <2c4cafd35d1595a62134203669d7c244@natalenko.name>
 <20200106183450.GC50058@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <ee2cb1d7a6c1b51e1c8277a8feaafe6d@natalenko.name>
X-Sender: oleksandr@natalenko.name
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioXJN-00Bpxx-Pg
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi.

On 06.01.2020 19:34, Jaegeuk Kim wrote:
> Thank you for investigating this ahead of me. :) Yes, the device list 
> is stored
> in superblock, so hacking it manually should work.
> 
> Let me think about a tool to tune that.

Thank you both for the replies.

IIUC, tune.f2fs is not there yet. I saw a submission, but I do not see 
it as accepted, right?

Having this in tune.f2fs would be fine (assuming the assertion is 
replaced with some meaningful hint message), but wouldn't it be more 
convenient for an ordinary user to have implemented something like:

# mount -t f2fs /dev/sdb -o nextdev=/dev/sdc /mnt/fs

Hm?

-- 
   Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
