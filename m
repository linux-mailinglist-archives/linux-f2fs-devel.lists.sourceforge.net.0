Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 747872CF891
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 02:24:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klMJK-0002sH-6l; Sat, 05 Dec 2020 01:24:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1klMJI-0002s7-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 01:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PKRlkteEv8tPMA3K5evuUQOyOC/0MJ0oDfftjWBgEw8=; b=AnGf7aywqiYRbxngRNWxnvtYJ0
 98OJk5hcv/C0SxItL0If7P5VsFJovl2SNkRZaGjbnu7RWLaIsJhUPHQxeW/LcFAl8bl17XLT3FIeM
 n8oOLxMrypCv1k6RB/iHt6h7HM9pgW1/y9143u2TefhbT3Br7LfUa7Q1M3dybCi98Db0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PKRlkteEv8tPMA3K5evuUQOyOC/0MJ0oDfftjWBgEw8=; b=YAkBAbuElkeKfbVX99F7yuMa0d
 2tHAb5OUPab7+UvzE7v/s7ULzHN9NyBEgBVxDgXO1yI0XZo711RN+5W3+oBuhhhHmKPPc0AMTza7T
 oauE3JkvTAqApMFS0JSCTcMbZjDxQ+JrcMsL5xY37aMsAUVoxJ2j61xLjEOcufeQqehg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klMJB-00G7s0-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 01:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607131451;
 bh=93gxGwOSBgRtHO3BuuzrRBtxRaKxnLT1haGacM/gHN4=;
 h=To:Cc:References:From:Date:In-Reply-To:From;
 b=peZvBJ61wuh4l3iXG2xtjPW/Ncr8OWr/9FXEu5Cuxk+u19McMXOPa3HeYcFM3jwMT
 sdu4q3okXvpK5A8b66g8tU4cdG/pzOKcRCVviZt3hNUXyr4cqwe5l0IEM15QQN4gmg
 ENzo6G2MEjoe/h6sq+s9tp2s3rNEHvCuZvFRbzUqZMv4luyPWhNsH9u8814ePLZR+6
 OWLALD4+GsdI4c//+qNRynNxIB6rN/gQCHBQucpEBvWZFKzYPvxdEF0Qfh+v0g0r/A
 UHdemDT1qBGodqE8+f/wzpmnwpRXA7qZAb4d1F0+BUv6mZCeyKa714ursHdzAglqaI
 /Ee00InKwl82g==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20201204102423.114091-1-yuchao0@huawei.com>
 <X8qJBdQZmZ2SyN9m@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7be5abe7-af85-4941-edc6-7e9b592a5dca@kernel.org>
Date: Sat, 5 Dec 2020 09:24:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X8qJBdQZmZ2SyN9m@google.com>
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1klMJB-00G7s0-Fa
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: compress: support compress level
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/5 3:07, Jaegeuk Kim wrote:
> 
> I removed wrong spaces here and merged in dev-test till getting reviewed.

Sorry, I sent the wrong version which is based v5 + fixes... :(

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
