Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098A19C9C9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Apr 2020 21:17:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jK5LB-0004r7-Te; Thu, 02 Apr 2020 19:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jK5LA-0004qs-G0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 19:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEJEWQGcXJEa/wu7pa8eKoGkuV8b2wwn+1NxKbr2Xt4=; b=BRLf3Cka5nRF2n6eGau1mcxfrD
 xguZe88Ho0mau1/ZpT7sn9U6sDLhOhjsu5VNLLkWuKKc5HNps6kL1MHq8eJxOJfg8vUA4/7VeVS1O
 s/YITmLJkpcjM/+wLl7PDsBg+xZWj4Q4Sb6lHAW58dknsgtY4+kMyRmFt+yiH61oRq88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kEJEWQGcXJEa/wu7pa8eKoGkuV8b2wwn+1NxKbr2Xt4=; b=fBtz8eh2+/ZAC4hVfgO2VzgN/L
 16N5YlcO7E28KKBME4UKriZwJ/RxjYXI5nZ3wFGQGSoOjAIeI0bZ0dB44OTfBVMDqK1SPWJHNVOdy
 Wmvc6pIHVB/gnt1b4YfxnIURfjX5khEjuh8sGBCCXBj+flOlzF7AVV6/NAuBDWbhZt24=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jK5L6-005M7M-Pj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Apr 2020 19:17:24 +0000
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 032JGwrK031509
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Apr 2020 15:16:59 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 2706942004D; Thu,  2 Apr 2020 15:16:58 -0400 (EDT)
Date: Thu, 2 Apr 2020 15:16:58 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Adam Borowski <kilobyte@angband.pl>, 955549@bugs.debian.org
Message-ID: <20200402191658.GR768293@mit.edu>
References: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jK5L6-005M7M-Pj
Subject: Re: [f2fs-dev] Bug#955549: f2fs-tools: fsck.f2fs segfaults
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

On Thu, Apr 02, 2020 at 02:01:26PM +0200, Adam Borowski wrote:
>
> After a lot of output on a damaged filesystem (SD card copied to an image)
> fsck.f2fs dies with:
> 
>  - File name         : mkfs.ext3.dpkg-new
>  - File size         : 6 (bytes)
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x00005555555593ec in memcpy (__len=18446744073323892736, __src=0x55555560760c, __dest=0x7fffffffe000) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34
> warning: Source file is more recent than executable.
> 34	  return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
> (gdb) bt
> #0  0x00005555555593ec in memcpy (__len=18446744073323892736, __src=0x55555560760c, __dest=0x7fffffffe000) at /usr/include/x86_64-linux-gnu/bits/string_fortified.h:34
> #1  convert_encrypted_name (name=name@entry=0x55555560760c " ", len=-385658880, new=new@entry=0x7fffffffe000 " ", enc_name=<optimized out>) at fsck.c:1132
> #2  0x0000555555562286 in print_inode_info (sbi=0x55555557db20 <gfsck>, node=0x5555556075b0, name=1) at mount.c:183
> #3  0x0000555555562a46 in print_node_info (sbi=<optimized out>, node_block=<optimized out>, verbose=<optimized out>) at mount.c:277
> #4  0x0000555555560d3f in dump_node (sbi=sbi@entry=0x55555557db20 <gfsck>, nid=nid@entry=24274, force=force@entry=1) at dump.c:520
> #5  0x000055555555e94c in fsck_verify (sbi=0x55555557db20 <gfsck>) at fsck.c:2568
> #6  0x000055555555699b in do_fsck (sbi=0x55555557db20 <gfsck>) at main.c:569
> #7  main (argc=<optimized out>, argv=<optimized out>) at main.c:726
> 
> 
> I tried building current upstream git, also segfaults.
> 
> I have a copy of the filesystem in question from before any repair attempts. 
> It has no sensitive data on it, thus I can share if needed -- 14GB.

Thanks for the bug report.  Can you make the file system image
available somehow?  Maybe for download at some URL?  How well does it
compress?

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
