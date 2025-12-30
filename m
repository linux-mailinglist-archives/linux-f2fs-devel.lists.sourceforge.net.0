Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB30CE8D4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 07:53:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCHME70PV5PRX108GF+46Pml4Q9g29KkF87KzDfWZrE=; b=Y5qmgp6Db3G59sv7wuSpD4sl7l
	fXnNiSJGqL+qwjLbJuspz1PnfLLgDIK8JhfkPF+NtDITLA6S+1OCFUwhaHoA4jl8xtBH+zvREiFCk
	JRb/Onj9PnV7Pd+NK1eFC17yxWobq2lCqZSSwVeHCjPTkbhH+ufEJPUTLdHjXYpdNNAY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaTbz-0003ev-3t;
	Tue, 30 Dec 2025 06:53:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaTby-0003ep-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HC+6tNuqW0uQV12rwel/75qIJJncbAiNgcQldVYFh9o=; b=KiJ3sem1dBbYcVX0Lyac/QGEQt
 yR7+o7t1OQcJl4XDs4kUJHGThqI1d7XGAVKrVF5aWvs3POcAvGmezffFaeVLVnkY0CALB76IFEvnT
 H+GglESWURxm9f67vbOoXkof3eKVScrbvp9vNYWAcFYtS4W5kPZ8XUz+6ThK0aSwwdOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HC+6tNuqW0uQV12rwel/75qIJJncbAiNgcQldVYFh9o=; b=gGIcl8n7As/f6RVsi2j086DE4j
 gj/0MECJSU/fMULDYnu9eQGxRcwuD9pYnQeeqgX8KUy7XlUEF/Ea6pFNBzdx9Krq4amcbyuMqNjSy
 v7TB/hx4BXRnA1j3rlhRCc9v8Xl78qKPVX8hJCpi8F9khw1tD/uYY8dKO5ZGN/6pJn5o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaTbx-0000Jv-Fq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B6CC4366B;
 Tue, 30 Dec 2025 06:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF73CC4CEFB;
 Tue, 30 Dec 2025 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767077616;
 bh=/T/IBazP7KBxWpTe1LsfcCPxBmtTWZKJHPR4379uKmw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jBWuUueqpFojKgwe9tnE7QpHYEGnCIFmGmWehGDryqIi0FTsE7rOMigKf3bPqpuk0
 L543sLz9HXJFmIEjkJDO05tqOLIcm6YfeUOfXoPt38BSP5MTMLo4SHCFCVu6vMARWs
 Oz+whcbyHd36kTydSN4kGqVLU/Zr0blShXvV3jtaV+EQZP3Hhn+eefAsN20J0U9jwD
 BoMcxIwQVUNkAkmLMcpzoLIuuxiWdDbgwsCAIbr/UIWbq+aEmBT1LJhMD+qoQNZs7r
 /FutOHXmWtBKF/EhDY9LoW89bo5INL9OQLhzyOIuXMyBpySk4FDq/YwuN/JzhECaYL
 I1rVyM93UWYXg==
Message-ID: <d7ad3b45-9412-4aa9-84be-9f95ba71096d@kernel.org>
Date: Tue, 30 Dec 2025 14:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251227091906.216322-2-yangyongpeng.storage@gmail.com>
 <20251227091906.216322-4-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251227091906.216322-4-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 5:46 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > > f2fs_folio_wait_writeback ensures the
 folio write is submitted to the > block layer via __submit_merge [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaTbx-0000Jv-Fq
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: return immediately after
 submitting the specified folio in __submit_merged_write_cond
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/27/2025 5:46 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> 
> f2fs_folio_wait_writeback ensures the folio write is submitted to the
> block layer via __submit_merged_write_cond, then waits for the folio to
> complete. Other I/O submissions are irrelevant to
> f2fs_folio_wait_writeback. Thus, if the folio write bio is already
> submitted, the function can return immediately. This patch adds a
> writeback parameter to __submit_merged_write_cond(), which signals an
> immediate return after submitting the target folio, and waitting
> writeback can use this parameter.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
