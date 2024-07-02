Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 436FF91EECC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 08:14:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOWmk-0002b3-8K;
	Tue, 02 Jul 2024 06:14:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sOWmj-0002av-J1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YaWx2uMhXIm6g60DknTLTqUgUXvYJ9FEu4tzwg5bFA8=; b=GVH5iO0iwsZ7iFkX4VGC5cbmJe
 n8QSn2dbfpwlBn/5mmwvBOW2p0fFZ//E3hg8zZfskQbo1PmKi0Vwx/y/KKhSdWga0isLFLxU+tGyv
 OMr3zVZYuYN/r/qifL9oG8nA/vXvRvPiFbh1Pwwh4kZSqjZcVLqb8aG8Bo9/sNZqHJ0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YaWx2uMhXIm6g60DknTLTqUgUXvYJ9FEu4tzwg5bFA8=; b=MUqb3dUMPlzZNWO8kMneE3ep99
 1FzcUrIjOcbxVczjWtQg4S7lh1og4r3bAKGHUBCf1w+v2ZinU5TYDvWoNrmoRnQkrxBwR9sllYrBp
 toqMAUysNpnuhs31MdHRulE8IA8m8NCsnbLrkXEVuheQYnwXWM9ve2FZ2gvWANyDX9uo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOWmj-00012T-S0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76E6CCE0B46;
 Tue,  2 Jul 2024 06:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E4CC116B1;
 Tue,  2 Jul 2024 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719900869;
 bh=4Z67GbZxOQabAJr3drErb60Fr2T6VBrEOJPGrzkhS3U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=obLXu6wHTZxurSrOXUKSCK2BiSuCgpAxCtxHQtu0anOY9R711aLW3QMR5yydQKvTq
 BepxMB+mTyqMGszXkXx/rM92LVZTUo3gMLkvxHYlmTfjD1cMHEyRlrq4/aWEWtGvJ+
 aqUpsfdfnB3iqMN15uyVYXZtt7RdsgaXfNI29+dN4GMxQJ0xyET7AquiDLrLikv/Sy
 Vj7MpGCSC82Z7adYTF2E6XkW+R0m6niqu3v1R+llQ8ITOS+w1u0yaZydzySXngZFz0
 qpcz0vLXjoEiwhfseudL0/rg5uOD4cMUZkdlNVv1gL3VHRxJkv2owwFvZMucgjzJ/R
 T1WGt0Gl953gw==
Message-ID: <9d834670-c959-4b3f-b394-b372e05bb306@kernel.org>
Date: Tue, 2 Jul 2024 14:14:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240628013140.2444209-1-shengyong@oppo.com>
 <20240628013140.2444209-8-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240628013140.2444209-8-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/28 9:31, Sheng Yong wrote: > This patch enables
 injecting summary block or summary entry. > print_raw_sum_entry_info() and
 print_sum_footer_info() are added to show > values of the ssa entry [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOWmj-00012T-S0
Subject: Re: [f2fs-dev] [RFC PATCH v2 07/10] inject.f2fs: add ssa injection
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

On 2024/6/28 9:31, Sheng Yong wrote:
> This patch enables injecting summary block or summary entry.
> print_raw_sum_entry_info() and print_sum_footer_info() are added to show
> values of the ssa entry and summary footer.
> 
> The meanings of options are:
>   * ssa: means ssa entry is injected.
> 
> The members could be injected in cp contains:
>   * entry_type: summary block footer entry_type
>   * check_sum: summary block footer check_sum
>   * nid: summary entry nid
>   * version: summary entry version
>   * ofs_in_node: summary entry ofs_in_node
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
