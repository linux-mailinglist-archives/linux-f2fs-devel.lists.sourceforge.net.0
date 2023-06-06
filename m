Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4648972345C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 03:11:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6LE7-0007pd-Cj;
	Tue, 06 Jun 2023 01:11:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q6LE5-0007pW-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 01:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRiiTrOGYmidt7+uwaYOaFmiHA30wUSatp2F43RsXNM=; b=W8x2DKDRhpONhs9+5bmGdlI59o
 0zGvxVSjwqLnNtvjbeW39JT9WRLwoslJXuM73dii0SD1jlWEa82TfGYK2rV0ZsTVIjK6AvKKNmgqz
 JLNd/wJSu5ylx5pLerhA/lLDm1P1d9EuctUT7Eyu0eWtkhSDUog5YRAWiJgNuCesWP0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRiiTrOGYmidt7+uwaYOaFmiHA30wUSatp2F43RsXNM=; b=LGiYOBsLManjKtNUhEMgWG3AQk
 dlUmThhaQH6akcP4ih6kfom1Kudg9s9vVWWutlOYwBkUDhZe6OCFUCFytQMdDNywRS92QXs1cUglf
 t7LjyFf15fNMOdGZIDnH6kRwEif+gyF7kX45v8Ou/ZqNw8/P2Kd/g4eix2YWcg+UjEOM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6LE2-0002qY-0D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 01:11:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6E786205F;
 Tue,  6 Jun 2023 01:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95B8C433EF;
 Tue,  6 Jun 2023 01:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686013859;
 bh=v+iFmUmGpocC9rT9XEBrvaU5BJbLM8ZNKrlK0Qm41SY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fviE26N9lT+7CePMHS+XZ3eO7M2dTx66yJ+KzpjzNOXBvIARIFtiVkL5eNyo9YzVh
 0DMjHOnjWTYGi/VxME9seD/JDuHyYMXUFUsmqoJztmO0G4DQ+8yCy1wo78fNhFjiHa
 xTLkOOSqseaYZRn5Bq9xtsazs3gsBHXvNqBkjsl+GDVQkc85fGiw9fAhH/098oHfJI
 905Bl8Fpa5Yom8riMXSpfqDaevbuwm1MyazVOHSQEdXJ2T/o0IaoSNSKNVtJj/1aoC
 UHOs4I1WdAFIK89pzM6t5K3Q8BEPESm9ymorxTmEFsV3mOqn1eVirW4Pc2TosZLAfv
 QH/1UwsTeCk9A==
Message-ID: <3c3782b0-fb1c-bcc9-a45c-d4691ab780e9@kernel.org>
Date: Tue, 6 Jun 2023 09:10:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230601013759.75500-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230601013759.75500-1-bo.wu@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/1 9:37,
 Wu Bo wrote: > The NULL return of 'd_splice_alias'
 dosen't mean error. Thus the > successful case will also return NULL, which
 makes the tracepoint always > print 'err=-ENOENT'. > > [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6LE2-0002qY-0D
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/1 9:37, Wu Bo wrote:
> The NULL return of 'd_splice_alias' dosen't mean error. Thus the
> successful case will also return NULL, which makes the tracepoint always
> print 'err=-ENOENT'.
> 
> And the different cases of 'new' & 'err' are list as following:
> 1) dentry exists: err(0) with new(NULL) --> dentry, err=0
> 2) dentry exists: err(0) with new(VALID) --> new, err=0
> 3) dentry exists: err(0) with new(ERR) --> dentry, err=ERR
> 4) no dentry exists: err(-ENOENT) with new(NULL) --> dentry, err=-ENOENT
> 5) no dentry exists: err(-ENOENT) with new(VALID) --> new, err=-ENOENT
> 6) no dentry exists: err(-ENOENT) with new(ERR) --> dentry, err=ERR
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
