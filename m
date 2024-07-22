Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4593875B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 03:41:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sVi37-0004dC-90;
	Mon, 22 Jul 2024 01:41:14 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sVi35-0004YQ-I2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5O8ag8lFdZX9LrNXgZmYogZkWUlR137tjf7ysY5Cc/0=; b=Prr6SE8+reOVy0Wi1uiV0nqqm+
 CRKmD7w1BI0/5yzwcOVOmBSjyTKZw4hM29BLoMJdEepa/CHwERT/dYpkmXuxuGTSvCKFkpA4Vn40c
 Zg98Kd0aEaMvZsBxCRC1K/0bbHX6aWTtH3nG621qxPdXiFNqgm0hr7QviTfDBm/nvAUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5O8ag8lFdZX9LrNXgZmYogZkWUlR137tjf7ysY5Cc/0=; b=ZH1WQUSZIopGxU7/zSnmzRPrRt
 a1pOZPn/Lszq4lj8OpaNlO83EzJbhj2oXGMZdGhRP3zD3huyNUuuIbW6TTfmrV+g3xUWiigpP0cWG
 qfZqnslpynJZY9Hez4b29zeau9Ki/7gi5FhGaXueLx0h2IFCFU99rE38l7Fz53J/hKmo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sVi35-0006p3-M0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 01:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 559C560A5D;
 Mon, 22 Jul 2024 01:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D314C116B1;
 Mon, 22 Jul 2024 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721612466;
 bh=QvZs/pCfri9h/XsR3H5ktdCz77vqOCseX8U2sVMOHCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aIPKoccM7YpbNcWtcdVarIni4QyC7BhG6Y4+lmhqaxe4LXBXZfHG9Y3DDM2ltUqbk
 eqxhOzCSlVpHqHWeWQj7bIVdheXnn9/cG9OXAa/TkNjUXwFn9CgyERk13J6++hK3aC
 9p7Ll3eIg9z2fI00l1kaoK2UwDpnOpo4cnguRfL3pywjEsZIr0Jbz7IOYs/OW/Ef3R
 lmrW1ZrtMpKf9i9S3oMRpS65TKxAleBHsacU51J1qlCfj/yZk7XatTRDYik45WMCeM
 xovvzeRc5rIUlQTb/YLPfHcRSWz1fDNIOhYqZ992pYGedOgtb3Ycf4V8ZAf+82BMVt
 a9v/ZAg13/rFw==
Message-ID: <62626888-0503-4f77-992b-12278a530eae@kernel.org>
Date: Mon, 22 Jul 2024 09:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1721295366-21008-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1721295366-21008-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/18 17:36, Zhiguo Niu wrote: > This is a supplement
 to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes") > for some
 missed cases, also cleanup redundant code in f2fs_llseek. > > Cc: [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sVi35-0006p3-M0
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes and
 cleanup
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/18 17:36, Zhiguo Niu wrote:
> This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes")
> for some missed cases, also cleanup redundant code in f2fs_llseek.
> 
> Cc: Chengguang Xu <cgxu519@mykernel.net>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
