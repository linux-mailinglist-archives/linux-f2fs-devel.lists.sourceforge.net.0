Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDEB465C54
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 03:58:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mscIy-0000fH-Og; Thu, 02 Dec 2021 02:58:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mscIw-0000fA-FC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvqlXnIqeiCJG+HjyXXRFUVTdA/3uBA1KkSp5X0jotE=; b=fhtZCaD5smrpim6ELghUkQ4Wyi
 4ppeJRbk/equUi5EJ86wmScWkNPxWC2k8wjKV/ivQzfuxzxDGHbEkHCCU3yaUwTDsbU01+H9GN5KH
 rpeU22PX7nxHtKOZekoj5ZFHhSR+p9mkfhrzNL+Sfus6U2Ys1+PH9guwEEZ4Djjug3t8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QvqlXnIqeiCJG+HjyXXRFUVTdA/3uBA1KkSp5X0jotE=; b=GzOK0yRCcPP22Ij6xArf36rMuw
 m56w5sAD1dU+EnYe2UlzOISAho3+LbBzjS+8Fg4OGRuOYpCkPPtcI9aGt4DkZjSt7Amn1K4mFrvfM
 53sAXgkdOyym+2HiuGPc5C1IvI8u5v4I5mpj6xf30q1R5gCTlFnzyVJBi8q4T8m9qgLg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mscIw-000xAa-Km
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:58:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3FB3B82146;
 Thu,  2 Dec 2021 02:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC45C00446;
 Thu,  2 Dec 2021 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638413909;
 bh=LraxeI1/dxSjuRHUMtK9daJ6qzZS2pK9w3OIW9Mp8XI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X16/N+w8CZnooamPDrNtzDzBPN/4SdJJFE9IEM5hB8qzbLGDAO95zNDlU//s7/zR9
 jjd3mk19oP9xXXxNty6Hgowzq5H6mAtw0CFWvUUEXa3oNnP1ECkTg7a3uSnC+IAQny
 YaKA/AVTPUfgVtoSr1QDZOXD2YleCxBhS5+NzDPsSiNGmMB1wbPEdX6SQHlsGj6cuc
 b25m2QXRFT68qjzSx3zyX7B97L0uL5+JcNxFLCMsqgpicvA396Vc3ThE4BsDNoxabd
 J6wRGzGZKqkL+08pdcM5AlW7oZGnbMukuqmyarr51p0Aojd6bpTGLzel1BxIPFD0AJ
 Tux1aky90NZLg==
Message-ID: <9a0d8831-7544-7778-5f98-48fba55cf9b8@kernel.org>
Date: Thu, 2 Dec 2021 10:58:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-3-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211116214510.2934905-3-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/17 5:45, Jaegeuk Kim wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Replace 'if (ret > 0)' with 'if (ret <= 0) goto
 out_unlock;'. > No change in behavior. > > Signed-off-by: Eric Big [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mscIw-000xAa-Km
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: reduce indentation in
 f2fs_file_write_iter()
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/17 5:45, Jaegeuk Kim wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Replace 'if (ret > 0)' with 'if (ret <= 0) goto out_unlock;'.
> No change in behavior.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
