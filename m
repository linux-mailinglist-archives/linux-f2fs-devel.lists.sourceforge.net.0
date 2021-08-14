Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6233EBFA5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Aug 2021 04:08:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEj6F-0001fV-Uu; Sat, 14 Aug 2021 02:08:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mEj6D-0001fM-ST
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4P5Pg1Zf3/UOYdU3qaWjUCwsxYsfEhzeC+CUAM0TM4=; b=QOhNwHxFL980UhW2wW9tX81gCc
 g3qLI4Aozj4DFOiBgXBXm4210z3I59IxrHpLJFe9lAU1i6Q6Q1tWpQOMb0KD4Gg2lCvWcOpJVrOeM
 5VyGosD6Uv1Juq7NQYCQOosnKGttFPYndMFBeXIwhEm9j6BKTnEnT/+HANdH5aREfFjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+4P5Pg1Zf3/UOYdU3qaWjUCwsxYsfEhzeC+CUAM0TM4=; b=RNdc8Lygk142AzxjR+coB4Wh9z
 Sk6Sa9L+8qSHlh55gHhqLEavrMfBAOA1z2EsqmjNkwQNDJxTx3mUwkaWRg4x3SLG7Tu7R2yOrQdfE
 Kf8Gn9eU+tinzVlo1U+QMBPaKY9Z2mWuxZm8C4oElHfpuOBJ1/k7fyITBSsy4PEQ79co=;
Received: from mail-m176236.qiye.163.com ([59.111.176.236])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEj69-005fiO-4q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 14 Aug 2021 02:08:37 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176236.qiye.163.com (Hmail) with ESMTP id 81E3078009F;
 Sat, 14 Aug 2021 10:08:25 +0800 (CST)
Message-ID: <AEMABgAWDwhd8*f2P*fotqoY.3.1628906905520.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.251.74.231
In-Reply-To: <25e44e70-eca6-5e48-fca1-844f76ea3a06@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [58.251.74.231) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 14 Aug 2021 10:08:25 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Sat, 14 Aug 2021 10:08:25 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoeGkxWSE8aSx9PSBhDTk
 pDVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OQkNDQkxPTEJON1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PjY6ORw6LD8MEx9DUR1JK1EdFA8KFCJVSFVKTUlDQktNQktOQ01CVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkNVSU5KVUxPVUlISllXWQgBWUFISkNKNwY+
X-HM-Tid: 0a7b426adfbed9aekuws81e3078009f
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.236 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.236 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mEj69-005fiO-4q
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH_v5_1/2=5D_f2fs=3A_introduce_proc/f?=
 =?utf-8?q?s/f2fs/=3Cdev=3E/fsck=5Fstack_node?=
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>> We can't remove stack from depot, as we store them contiguously one after
>> another in a contiguous memory allocation.
>> 
>> Or we can limit the recorded stack number.
>> 
>> $ grep -nr "SBI_NEED_FSCK" fs/f2fs/ --include=*.c --include=*.h | wc -l
>> 53
>> $ grep -nr "f2fs_bug_on" fs/f2fs/ --include=*.c --include=*.h | wc -l
>> 135
>
>I didn't look into details of stack_depot_save(), two stack handles from below
>call paths will be the same?
>
>- move_data_block
>  - f2fs_wait_on_page_writeback
>   - f2fs_bug_on
>
>- ra_data_block
>  - f2fs_wait_on_page_writeback
>   - f2fs_bug_on
>
>If they have different stack handles, combination number of
>set_sbi_flag(NEED_FSCK)/f2fs_bug_on and their callers will be far more than two
>hundred.
>

Yes, these will be two different stacks. In the most extreme case, there will be 1000 (I guess) different places to set fsck?
Or we limit the number of recorded stacks to 10?
what do you think. The stack depot design does not consider removing the stack from the depot.

MBR,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
