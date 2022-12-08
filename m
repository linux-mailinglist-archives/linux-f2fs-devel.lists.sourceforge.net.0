Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9BC6471F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Dec 2022 15:40:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3I4M-0008Dc-Bz;
	Thu, 08 Dec 2022 14:40:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p3I4J-0008DL-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y75+ZggNjhauOPioozqL34d9a7zEbVFJScvtzgaa1rc=; b=Lr3k2JepvytgbfIi/ukw5dD5sJ
 p2SC8ILiVfNaKa1HCg9iZLuVn8TLcLasvkDRcH2XH0odCTGrXa8b4BDAmEqw8WGfUbStP8dgBe0tw
 f7ktGxcBujLt8zVdR4/Lx2l1IF+CnCeJuATEDazjaKosKtGPY/8L9Dlz492tiyHqqAe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y75+ZggNjhauOPioozqL34d9a7zEbVFJScvtzgaa1rc=; b=DZPmgiSs/g93jzSx9jn8ENCul2
 gp6tofbvFL+gNzXlC1ks//0zouT5HhiZRuVOdnjUh9+J+STtwwaxqLmwrwA5RR6j2tDImZzvIKNyL
 SAcKxa4VZ7moS6eunoqgkuCOk3VCYmP/Nv4i9iryl8mzRUcNHLddwVmNSC9PO4E2ojNk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3I4H-00AKMn-Mn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Dec 2022 14:40:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97207B823D2;
 Thu,  8 Dec 2022 14:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B4FC433C1;
 Thu,  8 Dec 2022 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670510401;
 bh=y75+ZggNjhauOPioozqL34d9a7zEbVFJScvtzgaa1rc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J2hlXy4kitC8q0ghAN3L3GLuQuDGnu4A+jNvI73iamcNmODdAhMjZlpsPsbnJqehP
 GUbnRsh0YoMWKV5C7J/CEC0DolgzA/uvqRF8YGyJOhwOA5XcHfSHfkDX7BZepLufDf
 G80jQoSRUzhCJ1pho7gulCZZ5iaPkR9NGBlATA1XTgt8ohqt/sPjVvVYYGroOK9iKg
 IWP72O5ff9WPPwaDyAUxI1sa1SGZb+6UPc2+SiuRad878OY6mXsj+T4jFlmENv1mHD
 eE5BeNhjj27/+GUwEB7MRzHfD+eNbo/hgn8J/ikeE41t+LTD1WQen718kPGU2MeOYw
 DaCtjSmeHWkKw==
Message-ID: <37eca869-9a63-3f4a-7bd3-bfa3d489211d@kernel.org>
Date: Thu, 8 Dec 2022 22:39:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20221128094346.1256688-1-hch@lst.de>
 <20221128094346.1256688-4-hch@lst.de>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221128094346.1256688-4-hch@lst.de>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/28 17:43,
 Christoph Hellwig wrote: > Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3I4H-00AKMn-Mn
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: remove the unused flush argument
 to change_curseg
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

On 2022/11/28 17:43, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
