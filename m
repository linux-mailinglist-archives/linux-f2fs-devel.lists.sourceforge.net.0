Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110A4819FA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Dec 2021 07:37:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n2p3r-0004ST-7m; Thu, 30 Dec 2021 06:37:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1n2p3p-0004SM-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 06:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PDtjBM8NNjODIyQ4197jeB38Y4I4zBa44aEPTRS47gw=; b=IytNv6P3e28+g9JrFMnRrafBUT
 KbliayHGSVioUbDPjuAGdjFA++DUBCrjCwp05kAfn44dxEgD36wkZTA3wVNKa6fe7plV52l/H1NDi
 Aa6lsvnr8JQPSoPOkvBu+FAQdKqVbAwVEoWmWN7iLtowfMnJuoe0FwmgrIEC4hDmF4jQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PDtjBM8NNjODIyQ4197jeB38Y4I4zBa44aEPTRS47gw=; b=ahJNQk2/6pcA9EcDBYjdo2zX7D
 LhLHeUj4YjpywvdO7z7JDhC+mD6UE8yN4FbpVFUPqRhJOgS4jFhB+QqdOlGDVPCGLCkTcCcki95GT
 SJZJJmmwlW70CmelDbHlSRuBpXdBZi+n78QYl0g4yBSNNIDgm4wz0wIma2VvVv21It2I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n2p3l-0007oo-Kv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Dec 2021 06:37:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BA32615AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Dec 2021 06:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A33C36AE7;
 Thu, 30 Dec 2021 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640846223;
 bh=kxs0yNf+JfJvs6MssFMgtJ/46fWVg6XcH0FrpZ6Cq+o=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=aVWz3CKN5r+sl/I17t+2OyPKvaZO4m21tu3Rgmv/g593gfAjpXVgCWYlsXY2c+uy6
 I1RmOQzivk2Ex9UxPlQgFwAfWjFEV3zzBdl1noDuAtOJYRhaEvaUpKpuAbnAipEv8I
 1ZBKbnt76w38iqMamwnwTSMuI8sALnCCzGtNxZ01E1QDwsy79dctfvoJhFK7B/K5s5
 dl5LSyr/S2AY4e6puafU+AqDqrVpTojBkeerKSPsyLkH+CJYrNobCETmFwa7lw/ZYA
 Rqf2r7n9jqqNxeVXmoF5yPLl/k9ylmYwZDFfp0ZFP5KuIB4E+LN9UoqS36PE5gWbTw
 VIalmpTKMmkJA==
Message-ID: <953ccf2e-69fe-f8c6-03b9-8fd62162a21c@kernel.org>
Date: Thu, 30 Dec 2021 14:37:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211214182435.2595176-1-jaegeuk@kernel.org>
 <20211214182435.2595176-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211214182435.2595176-2-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/15 2:24, Jaegeuk Kim wrote: > This patch tries
 to mitigate lock contention between f2fs_write_checkpoint and >
 f2fs_get_node_info
 along with nat_tree_lock. > > The idea is, if checkpoint is [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n2p3l-0007oo-Kv
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: do not bother checkpoint by
 f2fs_get_node_info
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

On 2021/12/15 2:24, Jaegeuk Kim wrote:
> This patch tries to mitigate lock contention between f2fs_write_checkpoint and
> f2fs_get_node_info along with nat_tree_lock.
> 
> The idea is, if checkpoint is currently running, other threads that try to grab
> nat_tree_lock would be better to wait for checkpoint.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
