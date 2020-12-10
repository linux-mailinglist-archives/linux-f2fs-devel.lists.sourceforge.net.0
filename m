Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A76472D5593
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 09:43:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knHXs-0000wW-Sa; Thu, 10 Dec 2020 08:43:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knHXq-0000wO-Qj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kaf6SE3CcJng7hFfSOUqnpbRaR5mTLGBbLC+CrOtJH0=; b=SYBSV0YD09GDFsW2fqM9BEZTa8
 bUHDA/jwE45cAdbMDeln2MHLUO1ePRvzXJkbXF9yTEQGLmbaWXwSgkhPgUneOCBFxHSJ9i+e67ZqJ
 pT+JMIiIDQ0Ay6L0TqNGZz/tPFoGjNeYtvoUmNWWVXSIW5B6b5INz5kHVHe5deACocsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kaf6SE3CcJng7hFfSOUqnpbRaR5mTLGBbLC+CrOtJH0=; b=NdxBRaZCjI9XhwLkcKk7NjnBw6
 c/rbpaloBeMuJojhVCCHAI4hzGjD+lXWexZXNBlS2fVzx3bZguXd0nRdcJ5NavJpPTjZHvMNIIXzl
 qeInNpYQM5XcCW9ObZvvh+FIQAJs35KmKoJ+Qq9dPfjt+7hRIkyDQVilipaxJuSMYK+g=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knHXc-006CR6-47
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 08:43:26 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cs6q849KSzM356;
 Thu, 10 Dec 2020 16:42:12 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Dec
 2020 16:42:51 +0800
To: Robin Hsu <robinh3123@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20201208081555.652932-1-robinh3123@gmail.com>
 <20201208081555.652932-3-robinh3123@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <785e9f0a-c3d6-9cc5-f17a-a3cc58a43a0f@huawei.com>
Date: Thu, 10 Dec 2020 16:42:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201208081555.652932-3-robinh3123@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knHXc-006CR6-47
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs-tools:sload.f2fs compression
 support
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/8 16:15, Robin Hsu wrote:
> From: Robin Hsu <robinhsu@google.com>
> 
> Add F2FS compression support for sload
> * Support file extension filter, either default-accept or default-deny
>    policy
> * Support choice of compression algorithm, LZO (version 2) or LZ4
>    (default)
> * Support custom log of cluster size
> * Support minimum number of compressed blocks per cluster (default 1).
>    A cluster will not be compressed if the number can not be met.
> * suuport -r (read-only) option

Could you please update manual as well?

> +
> +	/* sldc: sload compression support */

Personally, I don't like the naming method of adding "sldc_" prefix... :(

> +	bool sldc_en;
> +	bool sldc_use_allow_list;  /* default false to use the deny list */
> +	struct compress_ctx sldc_cc;
> +	u8 sldc_ca; /* compress algorithm: 0 = LZO, 1 = LZ4 */
> +	compress_ops *sldc_compr;
> +	enum filter_policy sldc_policy;
> +	/* max_cppc can used to specify minimum compression rate */
> +	unsigned int sldc_min_cbpc; /* min compressed pages per cluster */
> +	bool sldc_got_opt;
> +	bool sldc_immutable;
> +	struct ext_tbl_op *sldc_ef; /* extension filter */

The variables name like sldc_en, sldc_ca, min_cbpc, sldc_ef makes developers
hard to understand w/o comments, and also there is no comments for several
variable like sldc_en, sldc_cc...

Could you please improve the naming like f2fs-tools style?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
