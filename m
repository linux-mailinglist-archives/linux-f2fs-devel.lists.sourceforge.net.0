Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63C39D2AC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 03:41:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lq4Gu-0004hP-RL; Mon, 07 Jun 2021 01:41:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lq4Gt-0004hI-VE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2BcUNzZI1qM2/m8JUVM+en7pWNGHc7w7dTo0WukG/4=; b=e5Qe73XAeNOl5UAuQO8FzK3ZTl
 PZNQE79uyHPPCNuPqff1R70vkV49hS5+dBM5LxH3grVs88vxGWXyMl3UO41QzblwNdGmolohnBswS
 XtcqK9Pd7Ards55U7trb0tGglIBrgT57b9ofejKosM+k38MA6Y54deNshA5VJXsjAHjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W2BcUNzZI1qM2/m8JUVM+en7pWNGHc7w7dTo0WukG/4=; b=K7tgNVRKkLknROLLxwaHNavNk/
 HbW/ue6SDoqQXKgyPS98blAq0o1HkSwnRU76ORJjYbQIROc5KnXpPJttOVrjM6dw+vQDhTD0DLbGM
 ttnvr7NUpi1sVBUm+rxchlsucMvjKXhMsxmPSO0NpPau4/ybgqc2mrcky9WnQe4+a2fM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lq4Gn-000199-N5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:41:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DDAA6120F;
 Sun,  6 Jun 2021 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622987612;
 bh=T9Mid5vJotYKc1BgooDYJRNtn/k2VlQX+UetnopSvjc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=K0EMoEIPoiytEnK7B4ovvewslqmX+eB63WcCV0ocRdygeYCTmCvmKdK5K6UAWBZki
 m+vFDzkqKBqVgl6lN9Pyb+6f6vyhGO8TpXVraOur5v25UrBkjijp4ePXhcA1M//c3e
 wihHXKIbmjNMD0r/FowSCotYo8W+m69t/q/WdmE0VKtFPIbDqgYI7XoFOyWgYDm8Uw
 z4EolGrMokx9eEdIy3lQ2TrQpVfxp31h8yed1xgr2JMyJp+W7R3R8pUa9k+JYC1DZT
 QugWbQN3lRYYtVKrAEP03HIVbCDiltfVWh2OLAYXtquDB0u972uhKgn4VMzNpYkwGa
 n2mL+wkxvZ40w==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210525204955.2512409-1-jaegeuk@kernel.org>
 <20210525204955.2512409-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <95b5669f-a521-5865-2089-320e2a2493de@kernel.org>
Date: Sun, 6 Jun 2021 21:53:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210525204955.2512409-2-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lq4Gn-000199-N5
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce FI_COMPRESS_RELEASED
 instead of using IMMUTABLE bit
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/5/26 4:49, Jaegeuk Kim wrote:
> Once we release compressed blocks, we used to set IMMUTABLE bit. But it turned
> out it disallows every fs operations which we don't need for compression.
> 
> Let's just prevent writing data only.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

BTW, we need to expose .i_inline field to userspace since there is no
way to check status of inode whether it has released blocks?

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
