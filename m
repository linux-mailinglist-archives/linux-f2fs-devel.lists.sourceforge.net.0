Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C41B334F84F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 07:40:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRTaW-0007Pn-HF; Wed, 31 Mar 2021 05:40:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <me@beroal.in.ua>) id 1lRTaV-0007PY-1y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 05:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VIy27mkaLuLGNg82PaccETjitjfjWSJOjpDZwZbO25w=; b=bbXUBzdkqFGLVnRii9z9J9KzUW
 DiIgumwBaAXI1FnuHVvsjodEocHgqu8NzcnbsI9WM3RM823umLSdUkXsJeqJ4H905391lFxReWrZa
 p7UyMSmfYuhfOaFzk4DH5G0Qp//A9Krv13pZ73h8In1y/hLK1xJ6n+jGGzFeJJTAsmuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VIy27mkaLuLGNg82PaccETjitjfjWSJOjpDZwZbO25w=; b=V12ii9OXcDqLWeQ9jk7fRJk2LV
 KbtB02a+wZYMs3i7ve4Uud3VZnh/EcWb1bgy9mNZ6ki3EKBF4PgS0WTH2d0EG/QCkP8uvTV+L1EkX
 +Ijnnzbby9+UyDki2FZHsULAMCN9eqtMSisBYcIP9gN5+kzAVu8QnnR/dUGcN+Jzjoo0=;
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lRTaN-00FdWE-Qt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 05:40:19 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO001607;
 31 Mar 2021 08:40:11 +0300
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 31 Mar 2021 08:39:54 +0300
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG001605; 31 Mar 2021 08:39:50 +0300
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 12V5dnBM021842
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 31 Mar 2021 08:39:49 +0300
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <739ae455-07b4-7dc4-1789-5b162ed25ede@beroal.in.ua>
 <bc3759b9-c606-5e77-40f0-c590bbc53bfb@beroal.in.ua>
 <YGPTWqUtHqEyRLMv@google.com>
From: beroal <me@beroal.in.ua>
Message-ID: <10ac38ce-4e76-4e12-2112-bd4cc10d1ab4@beroal.in.ua>
Date: Wed, 31 Mar 2021 08:38:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGPTWqUtHqEyRLMv@google.com>
Content-Language: en-US
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [195.234.4.10 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_RP_RNBL        RCVD_IN_RP_RNBL renamed to RCVD_IN_VALIDITY_RPBL,
 please update local rules
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1lRTaN-00FdWE-Qt
Subject: Re: [f2fs-dev] `mount` reports an error, but `fsck.f2fs` does not
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 31.03.21 04:41, Jaegeuk Kim wrote:
> Hi,
>
> On 03/27, beroal wrote:
>> Ping.
>>
>> On 20.03.21 00:46, beroal wrote:
>>> Hi. After I extended a partition containing F2FS with a recent version
>>> of Gparted, the partition no longer mounts. `mount` reports an error,
>>> but `fsck.f2fs` does not see any problem (well, except for `Invalid CP
>>> CRC offset: 0`) and does not fix the file system.
>>>
>>> ```
>>> losetup /dev/loop0 arch-os.img
>>> mount -t f2fs -o ro /dev/loop0 /root/mnt/temp
>>> ```
>>>
>>> ```
>>> [ 6890.647749] F2FS-fs (loop0): Wrong valid_user_blocks: 16040048,
>>> user_block_count: 10016768
>>> [ 6890.647808] F2FS-fs (loop0): Failed to get valid F2FS checkpoint
>>> ```
>>>
>>> ```
>>> losetup -d /dev/loop0
>>> fsck.f2fs arch-os.img
> May I ask run this?
>
> # fsck.f2fs -d 3 arch-os.img?
The result is a log of size 270 MB. I'll send it privately to 
jaegeuk@kernel.org if you don't mind. It contains directory and file names.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
