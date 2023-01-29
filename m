Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5F67FE3E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 11:39:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM55j-0007Ej-7P;
	Sun, 29 Jan 2023 10:39:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pM55h-0007ER-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k9IY+p1zXZPmjR5iWE8OVyITeUa7n80WifqjOn9FglA=; b=J7VlQjgrGd7zMkjzYSvcug5Gmf
 P09p2FEB9pYWsRjF4c1Sn1XiDByVwd3jq0qUnhrqVK4buJwJukdOe4hpc9OpZ/yu2BysyuXE/645m
 n5QA/v+vyx5N5sjH82smSTjqydSDNtIAAcMwMbNN8VrpH16ONow7CiC8jfpxu/Z8K7oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k9IY+p1zXZPmjR5iWE8OVyITeUa7n80WifqjOn9FglA=; b=gryB74vjmFiuwQXPIJrSR25DCe
 GtT+LAME0Qwi8EvettrX2rcRb+6dLxaabBIhYsjtTabA7a5Sj5OCE5bbcQ4Apmb1yzNkaUEsY8hgi
 o1vH2T4rw48/aJUrcoGVGv4dJMbV86E27HekUVeyhlg3rDm72cizz9X1NilHoimLacBo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM55e-0006uf-Q0 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 10:39:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5292CB80CB1;
 Sun, 29 Jan 2023 10:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D09C4339E;
 Sun, 29 Jan 2023 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674988748;
 bh=zoMMNXlm+0jOFtYtfc7qSditX9/ZdJj2AIRDwVK9fN8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B6V+FXHffAmucUN4SGbX/w5eTFYvPd3VSiXTiUYElqk3BL23M3Kyajack1ZXGHhmQ
 1dT73/2b2x7cmiMGaby+b0KRkQHhyD09iQAqK9/pd0mBZFFPMf/EmTRSgzoIebZ8Ce
 GZJLAjMV61Y7u5P5j53VGJZehehFOG1oL6+5b7ng9Ow2M7ksjaFIJSj1Z1zJDpkC0g
 jMLOiBpy9jGOjyku3wGG39mTOv+XRXZiEmv24IxZRmKk4rPcxaqzxUrg2QFPIPsuiO
 ZrKCyJxOb5LE5WRe5XjsBt9EuK4mSyYVI49Q4pq4oy7hfDD/103XY03j4idq922uh8
 M4TXQRUVX+SYA==
Message-ID: <de312d85-cc87-7e73-1d8a-b36c63528270@kernel.org>
Date: Sun, 29 Jan 2023 18:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230119063625.466485-1-hch@lst.de>
 <20230119063625.466485-6-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230119063625.466485-6-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/19 14:36, Christoph Hellwig wrote: > Simplify the
 check whether to allocate a new segment or reuse an open > one. > >
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1pM55e-0006uf-Q0
Subject: Re: [f2fs-dev] [PATCH 5/8] f2fs: refactor __allocate_new_segment
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
> Simplify the check whether to allocate a new segment or reuse an open
> one.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
