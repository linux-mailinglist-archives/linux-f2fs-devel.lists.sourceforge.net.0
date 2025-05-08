Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF47AAF710
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 11:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa+JSTeACFxaRAuoQ0PVJUI+cJbZHOZKxkGGq0lkgQg=; b=fe8xp+KNOselDQvBvvJ1ZigX5/
	ob4AEObsrGjcuIi+G3BDcgKDTihIZU2jezZ52wCCzUVlyQLxN1yEJcYYdpkBuihZWci2U0QB7Nllo
	mvJezAKWAcxtYA39fAUjbDJM5rjkTkk0GGGVutYxPQuikzdCLrAIRaenvOznVFm7opAU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCxpw-00086y-9x;
	Thu, 08 May 2025 09:46:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCxpv-00086q-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGshiarp3FKlRk5zyefYIYxEe8fk9mOvwSubcpS3Lq8=; b=kOofjD5oX5QPzhLsm3HAWl6Lq4
 mDooCokEUdARtJWzv3ogn21HWWrI5dOv6FcuLUoszqNz8RPFrvRApB5nKaIrXpdri6bdthB/TCJny
 yFIL2TThCNuBZFFITYLF7WYDt2XEx8YCfVbjYghwMBIgmpXqiZV2TCzZJJqJEV6MSqyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uGshiarp3FKlRk5zyefYIYxEe8fk9mOvwSubcpS3Lq8=; b=YbZVgVo71AVN/96Dnc0Jz6h34o
 dNQkboT9TfyzeZbUw1LIqUsmCMC65oBywBkX29m/RQZVtO3rNJjAdU3oAvVPV+io95MObxXa0qcCY
 xoAXBZOwrmIxfY1sY1dmm349qNzHq0Tkwy+UMHs54LyFAaS3h2ri4yIWB7V0K8obYnr4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCxpt-0002t9-I7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF92C5C0488;
 Thu,  8 May 2025 09:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA8FC4CEED;
 Thu,  8 May 2025 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746697586;
 bh=PVr6Rw+U6qooA71zLip5uMuQzMsWID+GyRiaQCci2Nw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Njqe3FVw+I6SIavF7nR7MGx0bMZZgM/4ILj8Zedbwzg454BX1l04wM8tTEd+wkBQz
 3kjH3Eu7daJ+R+enEXvMHpXQV+yqgpk5hjZjV+AUgmyzQXq9H68fK3/UKAjDAKp+sx
 CT7PDhCskEL2TLYo3FwJxGSJo880Hf3Ydz9etH9CkQDzkc+g0SymVQ9m39QsI48b78
 oV9x3NwF3/ih2C57ac5lq8OOtyVxhnk/ZtCha+BHKYyDhP1iqIt3RvrPmSzI1d/KvC
 /+6Ebpa9+tw95M6kx5GqjNnrGpVwDfLC2M44tucsZYJuMZ3fmMCoG4/+1VKlFhLtac
 pOWyfY4y50IjQ==
Message-ID: <bea92b8e-c20e-4dcf-91b5-4af4f71b00ef@kernel.org>
Date: Thu, 8 May 2025 17:46:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250508051520.4169795-1-hch@lst.de>
 <20250508051520.4169795-4-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250508051520.4169795-4-hch@lst.de>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 13:14, Christoph Hellwig wrote: > Since commits
 7ff0104a8052 ("f2fs: Remove f2fs_write_node_page()") and > 3b47398d9861
 ("f2fs:
 Remove f2fs_write_meta_page()'), f2fs can't be > called from r [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCxpt-0002t9-I7
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: remove wbc->for_reclaim handling
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/8/25 13:14, Christoph Hellwig wrote:
> Since commits 7ff0104a8052 ("f2fs: Remove f2fs_write_node_page()") and
> 3b47398d9861 ("f2fs: Remove f2fs_write_meta_page()'), f2fs can't be
> called from reclaim context any more.  Remove all code keyed of the
> wbc->for_rename flag, which is now only set for writing out swap or

s/for_rename/for_reclaim

I guess Jaegeuk can fix this during merge.

> shmem pages inside the swap code, but never passed to file systems.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
