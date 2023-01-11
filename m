Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92986665CA2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:34:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFbFM-0008L3-01;
	Wed, 11 Jan 2023 13:34:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFbFK-0008Kx-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uRMvlF7kzvJXvqL76PpA15a+26M2Xb1xUkQ0h7Vj4jA=; b=j4BTWgtAxz+cmYbEhV198Y/5zu
 vZoGVZUbHecPKzOceXKPjZsGpvaFs1QiMnPpA1ZVr6VCwtHcgoGnqL2FowEibtab1YdBQIfg4UxHs
 wRvOzm9tiawGNT+wuN1hZHIIxoklGIkpHJ0muzQUxjLUBxvexfvzcvJIE0N5chvWWhXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uRMvlF7kzvJXvqL76PpA15a+26M2Xb1xUkQ0h7Vj4jA=; b=mVTC4rWBmkRC8/b6MGGy37FhKm
 o7URLn0QkECdiL3YrxT1QwrRu4NQjopGC7TWIDHM5/ZXRXfVPPHxBUukxOvQkB9BuhO1ag+KPm2Hg
 FsYFvV5IigA/jvVUD7lHTRAYrryyIgzduF44he8meodNvGwddbEDN/Jn6RGJxGX41leA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFbFJ-000477-DX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:34:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23500B81BFA;
 Wed, 11 Jan 2023 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758EFC433EF;
 Wed, 11 Jan 2023 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673444057;
 bh=YVZANdPbH/3BTa60dWNOCN4zdiN2W1PrF5Me7iiAayY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dc2WvAuVHpGmhwqQXC+jB+D4VYt0AskCoXjZ1GcyLLMFV7w4gk6nYdHnwbP8mzstf
 mK+kVTuXq02t3QqaVTsTiErWYtPspdxBF63kmgUS68eOajhpogUZEZ7jHVgagTcVU+
 YxxV6yefsC0eWde+x6EZvPxYPMwlKdGM6TbRMhsiT6fLDETMqAQ0CyZeSbpTixzXXI
 xo8G4d9/KuqAxpbHc9sVUzrtpek1Zk4q8EpuI1pyxyo/NNJUZkfFqlXsmgGfG2fuX2
 +G41E9FS+GiAywYKtwIp7SiBHrv0RBV3uZpxEvCykEvU9Jptg56KFOEw8WMPpX4pJJ
 KlVbHfrJW3SKw==
Message-ID: <22eb9d58-f828-6094-00a4-c3cc9a9ce40a@kernel.org>
Date: Wed, 11 Jan 2023 21:34:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221217052448.60656-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221217052448.60656-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/17 13:24, Yangtao Li wrote: > Commit 1cd2e6d54435
 ("f2fs: define MIN_DISCARD_GRANULARITY macro") > introduce it, let's convert
 to use MIN_DISCARD_GRANULARITY macro. > > Signed-off-by: Yangt [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFbFJ-000477-DX
Subject: Re: [f2fs-dev] [PATCH] f2fs: convert to use MIN_DISCARD_GRANULARITY
 macro
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

On 2022/12/17 13:24, Yangtao Li wrote:
> Commit 1cd2e6d54435 ("f2fs: define MIN_DISCARD_GRANULARITY macro")
> introduce it, let's convert to use MIN_DISCARD_GRANULARITY macro.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
