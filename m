Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D3A9E205
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 11:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u8yLp-0004Np-3A;
	Sun, 27 Apr 2025 09:31:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <devnull@nl6720.me>) id 1u8yLl-0004NZ-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 09:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gAxXGz+cueX6GJNN9VFNOvGxujqk6DES7Tcl0skEl2U=; b=GN84awau98QqbR76zz6k95aWD1
 i2sDzlwh/fvajg8c3YEuTmBy1wHiSXdjD7Q3IJC6igjXnZwXYUsFdD2SitwLdd4lQCb0lPJisrW0R
 qAw++UKukUCEUt1xths6fVHEtuyc7vB6puExWDzPYUgGMeyHgSrK3RQHMxHOqOYFZwQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gAxXGz+cueX6GJNN9VFNOvGxujqk6DES7Tcl0skEl2U=; b=mB96BeAQ+kIKlCcIcrODGahD8j
 nH4dHhq4ZT6tt1Cq2yfFyIWk7JIvYz7dNk6OF9IhHU1mfj7AqoRBc2birmPeOJ630lsi3VOTJTWZr
 LJ8pnlFsY9r01p6wnLuxfVKSQd5uwqYbmKdJ8jehDIgY1QVEdIHizvaT6pgSCmELUEP8=;
Received: from dane.soverin.net ([185.233.34.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u8yLU-00038z-Dy for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 09:31:00 +0000
Received: from smtp.soverin.net (unknown [10.10.4.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by dane.soverin.net (Postfix) with ESMTPS id 4ZlhBw6gmRz18bc;
 Sun, 27 Apr 2025 09:30:32 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net
 (Postfix) with ESMTPSA id 4ZlhBw1Jd1z5F; 
 Sun, 27 Apr 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.soverin.net; dkim=pass (2048-bit key;
 unprotected) header.d=nl6720.me header.i=@nl6720.me header.a=rsa-sha256
 header.s=soverin1 header.b=uPQh9P5d; dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nl6720.me; s=soverin1; 
 t=1745746232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAxXGz+cueX6GJNN9VFNOvGxujqk6DES7Tcl0skEl2U=;
 b=uPQh9P5dYpBSmkf1gHxBl6VoQIFQI0vRXAf5q/m+fQTNHvB6a1IHrUEZEmNb4wS2hLbQXQ
 wySm7fsD5Mee9kbzzspshb18gaYlSUXdoto1/nEg3HZOf2bh3dlPsdWk1YzWhG0ncaKU8Y
 KtLU7qXKpC0DRSOHvw/aDQWsY5ZIE77Y2Lyl17h5FXhMiq0oVhtveFvWKwITN7rZtT4ILA
 JRbOfRuLbw7RVFOtFGTbQR0GooZgC/nE6IcUqNQLckJQthxPq0MVfBEV/gVnfzPOZWRVBg
 xfZZWdnqPwRVfU5Wo420Pb1Fch82hISNICiqiRt06kdxc1d0XnRrsUuFnb4a8w==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=680df938
 a=gDLi7OiDnwTL5vi9sMxOwA==:117 a=gDLi7OiDnwTL5vi9sMxOwA==:17
 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=NEAV23lmAAAA:8
 a=AbWLNOroRT5PHBGQ9kkA:9 a=QEXdDO2ut3YA:10 a=u4TTkWy4iRif133gqW0v:22
X-CM-Envelope: MS4xfPog7ibLOulLLthqgzYSoW9JRTXFZRjpkQKG1bEAlxk+Hjb9Rt86n9ZBf0bQ3NVRX3on3GElgdvB5lTFZYRWm57R/arggN4D3cb5vmAc7L+w1VsXtdeW
 QnoM7+pZEwZzsHHF0y7DjIJo59zE3JQgilWW51Cbr0BwS/DWk4gteRdBIywZCKJ06L1ND+WQjbmuJHYZ6aL75jfv82U1P+gQ6nygT4YHQEWpHJwmRwBrRDVM
To: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>
Date: Sun, 27 Apr 2025 12:30:31 +0300
Message-ID: <2375737.ElGaqSPkdT@nl6720.me>
In-Reply-To: <c2f5bc82-3e8d-4ca8-9818-d90be8ce374f@kernel.org>
References: <20250425013623.918150-1-devnull@nl6720.me>
 <c2f5bc82-3e8d-4ca8-9818-d90be8ce374f@kernel.org>
MIME-Version: 1.0
X-Spampanel-Class: ham
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sunday, 27 April 2025 11:45:59 EEST Chao Yu wrote: > On
 4/25/25 09:36, nl6720 via Linux-f2fs-devel wrote: > > Some drives operate
 in "512e" configuration with their logical block > > size set to 51 [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.233.34.11 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [185.233.34.11 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u8yLU-00038z-Dy
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: prefer physical over logical
 block size
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
From: nl6720 via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: nl6720 <devnull@nl6720.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sunday, 27 April 2025 11:45:59 EEST Chao Yu wrote:
> On 4/25/25 09:36, nl6720 via Linux-f2fs-devel wrote:
> > Some drives operate in "512e" configuration with their logical block
> > size set to 512 bytes for legacy compatibility reasons while providing
> > a more optimal 4096 byte value as the physical block size.
> > 
> > Since the physical block size is the smallest unit a physical storage
> > device can write atomically, prefer it over the logical block size.
> > 
> > Closes: https://github.com/jaegeuk/f2fs-tools/issues/29
> 
> f2fs uses PAGE_SIZE as block size, commonly it's 4096 rather than 512?

The thing mkfs.f2fs calls "sector size" in its output is 512 on 512e drives
instead of 4096.
E.g.:

    F2FS-tools: mkfs.f2fs Ver: 1.16.0 (2023-04-11)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: [/dev/disk/by-partlabel/512e] Disk Model: QEMU HARDDISK   
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 124997632 (61034 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 6.13.8-arch1-1 (linux@archlinux) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Sun, 23 Mar 2025 17:17:30 +0000"
Info: [/dev/disk/by-partlabel/512e] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: Discarded 61034 MB
Info: Overprovision ratio = 0.590%
Info: Overprovision segments = 179 (GC reserved = 176)
Info: format successful


nl6720




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
