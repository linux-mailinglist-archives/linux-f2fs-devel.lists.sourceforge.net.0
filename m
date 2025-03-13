Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD7CA5E97D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Mar 2025 02:41:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsXZF-0005ZV-Tl;
	Thu, 13 Mar 2025 01:41:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tsXZE-0005ZL-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 01:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fi9swCIQEYVLCjO7OKEUOhQfMhR5oqJkGlR7w54H6HA=; b=dXwJN/BoOkzgu/jLtGEJnvtZyc
 tkwwu60ZkWoWW8rq/NiHgGYiUi0h2VCAqlkXkt+8igSP2b31XxAzxJ+F27xRWniUmff0EoGGRNXJg
 55jyjWaUd/AkX4ODV/Zgm5KkqVRwe3fcAgs2b6la3zbqEt1kGQsGQs/5vp9jiZH46LdI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fi9swCIQEYVLCjO7OKEUOhQfMhR5oqJkGlR7w54H6HA=; b=hesWqbPKuhZJZCR5/B6+DDpXVp
 BTSGZgSXGOVVX7wKEkogT5acqfDTFTGiuln23HwSGoPHy7jFfsTmVoztLgy1ktye57RyLvAExmNbU
 WzhOEG/Xt5uesr8ylZwQizoBkqGW0vm0Ux80cqzymTZruoycPjGtgbm+saSyXqcxVX/w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsXZ9-0002mb-MH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Mar 2025 01:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 858155C555B;
 Thu, 13 Mar 2025 01:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C167DC4CEDD;
 Thu, 13 Mar 2025 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741830045;
 bh=w9J5nHWChf6uBiTKo5/z2ixwpEaxvAhMuRdr7AZcUBY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HL0bkHDTb0hz7hkwLnAGKc+EyXoctR3aftyzz6v5aBfUtc3UjOOU/UqxMiyc/qtz/
 YLe+XZTVB6W/w3zHo+Mdelbo2MYYG2Kv5DBTe3HFZ5Nc8d4o6OrV3SO9BvumSKUEF2
 5Iw3929wQfhs9OQsRMjsGe2Jm8fkN5RGLn9MOvcy2dPGpubN74A9owU4gsfBSMsokT
 IORvEkTver93kCusxbD20DEhqO+z/yHIaidQuu6qA9G5oqlSQpe7ZEfeowsdvyWg2e
 geMehR6mzNYsG9nmo9qyAe6ImO9dOE6V3V43EXoE5WE/3u5qKLa1Z3+9FmTz9GDknb
 Ycp10dAnQrwFA==
Message-ID: <0f6e7cfb-f4b5-4023-b787-51f6a842a883@kernel.org>
Date: Thu, 13 Mar 2025 09:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250303172127.298602-1-sandeen@redhat.com>
 <20250303172127.298602-4-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250303172127.298602-4-sandeen@redhat.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/25 01:12, Eric Sandeen wrote: > From: Eric Sandeen
 <sandeen@sandeen.net> > > The current options parsing function both parses
 options and validates > them - factor the validation out to reduce [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsXZ9-0002mb-MH
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: factor out an f2fs_default_check
 function
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
Cc: jaegeuk@kernel.org, Eric Sandeen <sandeen@sandeen.net>,
 lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/4/25 01:12, Eric Sandeen wrote:
> From: Eric Sandeen <sandeen@sandeen.net>
> 
> The current options parsing function both parses options and validates
> them - factor the validation out to reduce the size of the function and
> make transition to the new mount API possible, because under the new mount
> API, options are parsed one at a time, and cannot all be tested at the end
> of the parsing function.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
