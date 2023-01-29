Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2C67FEDE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 13:24:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM6jj-0008JD-BF;
	Sun, 29 Jan 2023 12:24:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM6jh-0008J7-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 12:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZqwHlD6HHx5UL2UnsUMK8GzaTWNQqUdgd+Xmtu/qBHU=; b=IR5SKxtFaouDVslrMyLHZA+8O8
 WJaxXuV5fzAbtLuDzw3Uiy/VSoFp94EtA6NLyaaULraXEJE66Gd7JMoGqe50cTjKHROVIzLXhcRCi
 c3lq6WBV2kMNhV29zOjDb6obJYPO+bzy2atVwfZmv5BDtT4wJIIF3AZ7qe2XzyACBjfk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZqwHlD6HHx5UL2UnsUMK8GzaTWNQqUdgd+Xmtu/qBHU=; b=Cz45IJ4+TJBPMwKHMGnMfqhkmZ
 ezc8wdhSmiENIqrg5FiDyT0HQ8zFr8IaP28iORXysVqwLpNvOvChihY0vIRRdsrxwbNxIdIt6Aem/
 INRMYzVmeirnrY88G143FIkUqVFRYfqoyVxOERS4yMmHF5vCym9lbks98eheBbJ13cNs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM6jg-002T2m-3j for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 12:24:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB7F2B80C67;
 Sun, 29 Jan 2023 12:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD8AC433D2;
 Sun, 29 Jan 2023 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674995072;
 bh=E9f8D4wiVvcHiiQc3dL0Vxh2/DAGIJuj+tDuzLrG5Es=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t9NmulCW1oLrfnctTWnTo6TVyh48JGrG8MxKpkCcmRQke1xao4uxAB95kvW7rUNEx
 kbviZmhGBaNb0bqbnFnxTgIGwysk7we9rw4u+jlDGplUzdslTbkNEFU3DhvQcgUpjC
 RMIv2LO7ZJdlwF6OJcxQHmmPbwI4TSmxnYbnwwl3WmbNJ4913/C5A0AuNqGPluLv1x
 YTzui2ZQmvhSPwVQ3YyNfx4oR9FjG8qb4DFaur71/eM/MSZdpgxOfBQp28AXn3pf3S
 B9hzPRyNLUNJW5cuysZ/4esF7icRQsA6AGo91eZ10trFPU+nDUl7y/VnS6Ja8OKymO
 zo7gC/Vt+pFyQ==
Message-ID: <c4007976-5ee8-506e-5ec4-adf8c02ac7c9@kernel.org>
Date: Sun, 29 Jan 2023 20:24:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-9-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230119063625.466485-9-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/19 14:36, Christoph Hellwig wrote: > Just open code
 the logic in the only caller, where it is more > obvious. > > Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM6jg-002T2m-3j
Subject: Re: [f2fs-dev] [PATCH 8/8] f2fs: remove __has_curseg_space
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

On 2023/1/19 14:36, Christoph Hellwig wrote:
> Just open code the logic in the only caller, where it is more
> obvious.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
