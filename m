Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C944A3D1C36
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 05:07:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6P3R-0000Ko-Tc; Thu, 22 Jul 2021 03:07:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hdanton@sina.com>) id 1m6P3Q-0000Ki-5i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzWKWr417ADLzTxzCbqR+qEH/SJBiViVF5QAEhka6QA=; b=fdeQCYhqqbMsWJB3qPJohbF939
 ZoGSUJMVFc5W7COPPRcnaTwbhhqME6T+MTXc7TR3bLem6t/TkwWwNrXHxEhRf3ZVO65EuCAVowdRK
 fPQT7yxYQiioN51JCXiyqN9kzy3G8ItIKmHbEifDBK/Z+Ag0n3K3zIg00eR89x5eweVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zzWKWr417ADLzTxzCbqR+qEH/SJBiViVF5QAEhka6QA=; b=jRZ5dtIABeK+H9bz5L6TDupNMR
 9wCNEE8WYUe6UWXUOq8hoY66OnwmmdnTOyNCD++sgUy7gnwIJ358w4xF+j5EkodvPOAg5cMlNfzKv
 WH/0CJTifXUudTWLrMcQeO7f24zGID7G9DmMhefFd4DGuszM/Z0AyjBzN4080DhS/REI=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1m6P3I-00GM03-OU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:07:20 +0000
Received: from unknown (HELO localhost.localdomain)([1.24.238.81])
 by sina.com (172.16.97.35) with ESMTP
 id 60F8E0D700017D62; Thu, 22 Jul 2021 11:07:05 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 74043515073402
From: Hillf Danton <hdanton@sina.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 22 Jul 2021 11:06:57 +0800
Message-Id: <20210722030657.1155-1-hdanton@sina.com>
In-Reply-To: <20210722014149.525166-1-jaegeuk@kernel.org>
References: <20210722014149.525166-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hdanton[at]sina.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m6P3I-00GM03-OU
Subject: Re: [f2fs-dev] [PATCH] f2fs: use rwlock instead of rwsem for journal
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 21 Jul 2021 18:41:49 -0700 Jaegeuk Kim wrote:
>
>This tries to fix priority inversion in the below condition resulting in
>long checkpoint delay.

If you are right and the patch makes real sense, feel free to specify a bit
more on the priority inversion you are trying to fix, and how the fix helps
shorten the checkpoint delay. And test data is welcome.

>
>f2fs_get_node_info()
> - nat_tree_lock
>  -> sleep in journal_rwsem
>                                     checkpoint
>                                     - waiting for nat_tree_lock


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
