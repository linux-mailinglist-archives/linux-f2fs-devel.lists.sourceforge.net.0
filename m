Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE116C6AD1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:23:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfLqB-0008JF-AC;
	Thu, 23 Mar 2023 14:22:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pfLqA-0008J9-JA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xBRxRdtbJAUT2jV+zTD/msAyMpz6AutpBXp0TseqPIU=; b=S1lVtOONxjKK9W/Vkl0CYRwjjk
 wQx/VV57jXGxwWCLcpaIUsNA3+LKiXu4Hg20qWUzCr51lAJX+N6+CMjldFZKms75aU8xcbU2pxxYB
 8iOpTXbPb7EL0mFBCdQNEh/BnxeMX79eoXfroxvWAMlj5TKTccKbSCw1RDaKHTsziLhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xBRxRdtbJAUT2jV+zTD/msAyMpz6AutpBXp0TseqPIU=; b=AunTVA21FNwRsR5tso4Wt/qxxA
 9UyhfOc1hpkWMvM3ba0QLOEL0I23YdV0ecSd10FkaTXlhUuc6PSjGJNaDOJquGxoAJqkOPEAud82c
 l1xARA2J/4eN29/KBVS1ls47mOnn2g3hPFFRRbQ8JmI3sileVSY1MeEUgNgo9Cezxyi8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfLqA-0004GE-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:22:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD242B82150
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 14:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234A6C433EF;
 Thu, 23 Mar 2023 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679581362;
 bh=oLBZ5saccObS7spgsMIqKWYoT4RvPNG3T4ino9R/8ZY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nuLlZifEIypUrr/JFr527EJNPaJFb4L0y4JjGyYA02xIuA4BlL9kGmqwZT8O7t0+8
 Wz0g7aXR4rq2VsWkf3h1Z+jv3nh6stkcw3/DBBj9AQIN75gA8YZ6+t88eHUjASaCEt
 cXvy9zakN1/wo3a4lkko+Ia/X+DhQHu1EDkzfJVj6SDViL3dXqHeoOKxm+xcxDUGi/
 Q4ypRMQo0WzIbPhCsnmZDgkYNHhEo2vBXc/yVsjoiLolv2O1SzcrJcrtDKV/7/kTBo
 0jrdVKdCRkswTxu1/EmobAiNJbNEgtFWhqMjmkAm7JIaKJqawowu04jR94WWKMgPqZ
 S/3sIdyAol7CQ==
Message-ID: <12dfeede-70e3-5c1b-7d3d-9f21c8ee9ff7@kernel.org>
Date: Thu, 23 Mar 2023 22:22:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230313201216.924234-1-jaegeuk@kernel.org>
 <20230313201216.924234-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230313201216.924234-2-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/14 4:12,
 Jaegeuk Kim wrote: > Let's reduce the complexity
 of mixed use of rb_tree in victim_entry from > extent_cache and discard_cmd.
 > > This should fix arm32 memory alignment issue caused [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1pfLqA-0004GE-Hn
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: factor out victim_entry usage from
 general rb_tree use
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/14 4:12, Jaegeuk Kim wrote:
> Let's reduce the complexity of mixed use of rb_tree in victim_entry from
> extent_cache and discard_cmd.
> 
> This should fix arm32 memory alignment issue caused by shared rb_entry.
> 
> [struct victim_entry]              [struct rb_entry]
> [0] struct rb_node rb_node;        [0] struct rb_node rb_node;
>                                         union {
>                                           struct {
>                                             unsigned int ofs;
>                                             unsigned int len;
>                                           };
> [16] unsigned long long mtime;     [12] unsigned long long key;
>                                         } __packed;
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
