Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF4533A8C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 May 2022 12:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nto7Z-0002mq-7S; Wed, 25 May 2022 10:20:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nto7X-0002mX-Eu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 10:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3LLoT9psFRXH7u+ttwKfcMtMPpkV6pTDoakX73NMcI=; b=m/T9tLFT8fiu9G5PKQL6wcFH+f
 tFOAT03S0VgO25fm1+PQCFmthJ+OTN5NsqaU2Z4yHrmVVrXhuRzfqg2TTuV1dj+Z54EL4vOK935Mh
 HByqoPaDi1PwacZWznjM2h92KsAbFMGR2fE9aU9/eoMGssXgAxvBlZn4vvp+rlN7sT0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3LLoT9psFRXH7u+ttwKfcMtMPpkV6pTDoakX73NMcI=; b=TeXeDVpeFEaklPJjNTJJ2Hx5E0
 l0UN7y+IMfxglIYNQbOggbmYYsJpOGbXKlTFoEHmvgIrK69SOTO41HA2kWqNn1n1E2GJOwSVIDkG2
 nUURX4FnDIv61Outi81HI03iL0z3o4j3KZuvEmtbB6KgxBiMlk3IviMfjqKPboV9c35s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nto7V-008lTE-Ua
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 May 2022 10:20:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE93A60BBD;
 Wed, 25 May 2022 10:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303E3C385B8;
 Wed, 25 May 2022 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653473995;
 bh=zNi9BVddPHdYzJhzN8S1giTTXHcermTY4kmOt2A3fq8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A8ci7a/7nNDM+myS4BLhlwiLbD428RqEJ2q6S+nkZyLh+Bc5BKvulasquSJcYwVBL
 pxeJ+5Hrr40zopfDAmyhzqv4Ot2glyjpUqqG/L5WN0yfCkaCC0tFdiSYg1/3j0Vv0k
 ZbJEcHKB/NJ218nM4gfKTCege93J65gfkWpGXoANVz1ZNbIv0rc1fXwFeeLoIIRv4L
 1S4+a2Pz+/74zk/oRkC72j19CH9WIks6QkqjIYFX5xw78Qc0H6uo+gq8DHaG+SAsOf
 LMo2f4weM5bx60UiHGema6nZd9lnpdeXXJT0VZPQ6Hu4+QLIhT+ZIpMuuoFyZeYLU1
 7eOy93WFSNnVg==
Message-ID: <ddb513fa-7de9-3224-a251-201c5a2b9cdc@kernel.org>
Date: Wed, 25 May 2022 18:19:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, jaegeuk@kernel.org
References: <20220525094336.2489995-1-yuyufen@huawei.com>
 <20220525094336.2489995-2-yuyufen@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220525094336.2489995-2-yuyufen@huawei.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/25 17:43, Yufen Yu via Linux-f2fs-devel wrote: >
 Almost all other initialization of variables in f2fs_fill_super are > extraced
 to a single function. Also do it for write_io[], which can > m [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nto7V-008lTE-Ua
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add f2fs_init_write_merge_io
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/25 17:43, Yufen Yu via Linux-f2fs-devel wrote:
> Almost all other initialization of variables in f2fs_fill_super are
> extraced to a single function. Also do it for write_io[], which can
> make code more clean.
> 
> This patch just refactors the code, theres no functional change.
> 
> Signed-off-by: Yufen Yu <yuyufen@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
