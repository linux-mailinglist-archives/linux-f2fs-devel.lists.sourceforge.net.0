Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3767367FE2B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 11:30:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM4wp-00064H-KP;
	Sun, 29 Jan 2023 10:30:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM4wo-00064B-HF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2ii8m6XSAPRvwdik0ohY5wZ1/PLSGAK7F/Vb44xqTk=; b=DopwQApXwt7XuCIe5JXswnB9ew
 bB21s11OkVjzRkafDSFhmLjZV/ocbtOpCD8TxUzpNQxgoi5WmtqGV1nWYHU8Iz/OuQACjaO7iM3Sl
 LLbRs5NUp+lLY/qwGMXozeBmQimhlNm73eMOg/oYmhgPEaTRHJ1wGIq2E4vEHG53UA6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+2ii8m6XSAPRvwdik0ohY5wZ1/PLSGAK7F/Vb44xqTk=; b=VkjyMNLahq/5n3QeC711bBD0GO
 D71nzvhGcdbsG2iIYt13bO+DXc3FNYEjkoDUT2wZ+efs3PXBhvIjNrUT9o7yQK/ABPHedRD7ph/iw
 gIDpVdkRLbrBQ9Ncx9L6eikGlEZnrDn92wrXvJcx7qN9SBoJHyqqJ6Rlwbo/66HIuA8k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM4wn-002ON0-9J for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:30:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB91060C15;
 Sun, 29 Jan 2023 10:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D00C433EF;
 Sun, 29 Jan 2023 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674988199;
 bh=i0aoUw8fJklNXCh2hq6J+33ZcXO3qhlADZTc4Wv2NCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rcXokX6XM5yKrTLEQ9A6ER6YnvF51UGs7U0MwxzcllYDUaMcbR5aNYlyTjkzDdJn6
 Gv48qxvGucmeQOEbNUVuCybY8g42XpgYVLVQpYnDpGuXKchnD/VHmql3U7MkAa0vrN
 EsIcnBX6Y5twEUKIcopi5lFLSFZSgh5V+qeZjE3fxR0mSQeSG0iZLtoaHPV07tV7o1
 tdgPPObHl+u40x8m29n/6ehx7Qj0jVzCOIXC1bp9YAjIx7MPVaMXzOforA0GqFSGaH
 4woOKSaymrXK/uUCh5LuGxhwGictpW2BwvDm5AM6W7Sr30OyrhtRbRHgASmEmi4ihS
 B5Gqz2/FXLsrg==
Message-ID: <62f40a10-040d-88a7-c907-47671efabeb5@kernel.org>
Date: Sun, 29 Jan 2023 18:29:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-2-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230119063625.466485-2-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/19 14:36, Christoph Hellwig wrote: > This function
 just assigns a summary entry. This can be done entirely > typesafe with an
 open code struct assignment that relies on array > indexing. > > [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pM4wn-002ON0-9J
Subject: Re: [f2fs-dev] [PATCH 1/8] f2fs: remove __add_sum_entry
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
> This function just assigns a summary entry.  This can be done entirely
> typesafe with an open code struct assignment that relies on array
> indexing.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
