Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D54756F6D3E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 15:48:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puZJf-0001hE-E0;
	Thu, 04 May 2023 13:48:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puZJd-0001gx-T6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSwns+CtM9qNAEAYBO6y8U/APIwFn9pvSiyKlWNkaoU=; b=aalNKatFB8Atcag+qXtBnbJNe/
 Xl7gZTogyXP7NI17B3zG0VfZ+aerDzk5+I9GpAHkF4SeEK1dF1FagC6BJi+ILHsHkkJBrSm5DsLT0
 mlWGN7/yCkJ6D8WhVqxiQt6ntBjHpCLZxzVMgfaZS3OMQI0NHiZs2FHMdnGJgubamg6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zSwns+CtM9qNAEAYBO6y8U/APIwFn9pvSiyKlWNkaoU=; b=AbkgNV6FHapgVO5TiSCgqjc2RF
 5ya86GgiPFoojAMMRe2SKy6kOxgP6A2uLJdq0jGRmSjg+3q3gbAY18y/GEaqSBpIST8SMCPsFTg5x
 I6Ehxyij+vygWtXpKVKWSSJKf+2frUb8eEK/OFtPFHvx28Yj6/FJx/PZJXxfHdOKVn8g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puZJe-00E1t1-4e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 13:48:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF631614F6;
 Thu,  4 May 2023 13:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D33C433D2;
 Thu,  4 May 2023 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683208088;
 bh=R9GKOXYE8PBV0LY9sI0Q299FOl49FSPW4seo6zskIsk=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=SJQr4kHdHxPmT1D1jnczqDSkjtXVsFUuGuMIN1CnHeXgOMmLV6fSvkTcGaGMq5b9Z
 TEl/BafjqL9bQbfNNX6fDzVN6z5O9E+g3fG6FbNCyinu/AvzsFMthcqg0KQHdV989/
 cR6If4+zn3wr37KnQBpRXbUT0jsApaLmc+tA2BzJVCn/Cyong61NXlYDow/EWiIRfG
 ovGVV8Wbi9s3zyytslHEPH12cN7W/RP5pDc/5T2Fo/NBi9Ve+ICbZKHCnyxK9krzNU
 jvnHkFkTM9Wsg612GufUOEAa7SNw715sI0cPS3qN/CH2q339j4N4xhdtk4Z9QVCg5X
 hQQV/eWQjPAXw==
Message-ID: <d6a26ad8-3c90-d932-d966-85414e0ae42a@kernel.org>
Date: Thu, 4 May 2023 21:48:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com
References: <00000000000032909d05fade30c8@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <00000000000032909d05fade30c8@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 2023/5/4 21:31, syzbot wrote: > Hello, > > syzbot has
 tested the proposed patch but the reproducer is still triggering an issue:
 It said the reproducer is still triggering an issue, however, there is no
 error output from the test. 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puZJe-00E1t1-4e
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 2023/5/4 21:31, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:

It said the reproducer is still triggering an issue, however, there is
no error output from the test.

Could you please help to check whether such status is normal or not, or
am I missing something?

Thanks,

> no output from test machine
> 
> 
> 
> Tested on:
> 
> commit:         2adb872d f2fs: fix potential deadlock due to unpaired ..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
> console output: https://syzkaller.appspot.com/x/log.txt?x=114b5338280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=86e4eb913e90d4b2
> dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
> compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
