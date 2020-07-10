Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4D221AD73
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ghcffa87RhscqvhMT5QaKGUFRtFnjC4GDbM7JC1m39M=; b=ElejrUSNdg+WVUTH4dxOgzeEK
	cTMvfm7zKC+PehFZ9YvYh3i2xxAvCtwqKI6//qq4gsqADKXGt16eQfyDs1KTLfZmg/aYmvTLsxcta
	Aw4awCy9Tanj6nlBxw691RNjCtJH9JdSysRWQEF0VwsN8vFegVIUs5TmcUl3F8ykKU/mc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjdY-0005G0-1K; Fri, 10 Jul 2020 03:23:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1jtjdW-0005Fq-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+e8G6U8M17K6Sqs+JivuMFEW/2OMSL/SNP3HX45wqnY=; b=F9lDyAVNZ6TuCIDzjNh9xSBqAG
 eHO2RPZg2PnGGIeqOiHNUKi60e/E/Z8D1CbPt1wMZQGR7FfGDUJXGEOgxPZcnwEsuarW5IPSpIRUG
 mKDaydrgqbGjpYtVnNbjvlzcNTRol2GBcpISm6Q9y6EKoGjoWBRlTnKPOXFm1nSZOW6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+e8G6U8M17K6Sqs+JivuMFEW/2OMSL/SNP3HX45wqnY=; b=PWLRliK56RYR9RGEfzsZ19fOEZ
 mqjSS24oanEB4HJn1A1elhJqncDQQAfEtuIjRO4rHcB9RzeVN2Lj/k3VlRGVBx/ZxHbl4DhCiSmnn
 prLB0Mv2aK+oXU9iBdpsC0HWmieH92RwKVphOMXyPdJn4gRa9X0CTOrmjtfsp0VF8csU=;
Received: from sonic314-21.consmr.mail.gq1.yahoo.com ([98.137.69.84])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtjdQ-001aOt-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1594351411; bh=+e8G6U8M17K6Sqs+JivuMFEW/2OMSL/SNP3HX45wqnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=qXRgCBr7SitTXoKAM+dmapU/ZZhWactuUARI59P1RNKuSM7s5/EWT5pVHPPWYO9fWmHOZ8QO12urH+UdE2oI5XWKRK6tFpgkCIFn4RqVOzNRnM7GURIYzIQrA/khyMKlUXBlEAPhqf9blMctxf6oYkzv63j2ym5OlJRW6IH/fWBOGAc6B7x4xVkYVwhk2owiTj09Oer5iLwibPy8edTXZddXbQYpkzLl8bHTv9SUIxm/Jugi4/0G2ccZUc5Vu3txtjqV1hghzLxmSBo19jf3D6rNLiIjv+s7JjgTHvt4oTIwWtcVGFuEX1MQQOVFYxAianX2+GRonbkS8d2KmJ4+sA==
X-YMail-OSG: MYgNXAoVM1nUwgbCK.4aoFID1lBjrDYPdrSuO6.u.qF1KggE2pJ1orjrlrXRm_X
 wco0kNn00kw2_1o8ZBHZyo7F._ondZYPgL0cteRS_l0r2uTxMlHTrjdMWeKM4K95RouhwejNBSec
 IImmdu9io6m_hfr99am7L9m61dA6Ki7zo8_6NHadweYLzSEKfOuLW7bAp6ZRxDi5E5ZPNT2JSTy8
 9iC4hkG5.IzlwgaQ3AJx3mzFJDzhd7vvdQ9j9xwthoTwl12Fbl2QDz7krptkS5nttDAtA3ejTTRr
 H7gOjgED0NeZLduI.7izcOkZJl8q3a3hIVfl1G50gJ0l5UYykDV4JNBkAdTNuSCaetoN7Lck38lU
 D9HXGDwvTi3ju5vaiyauUVK9azsdNYJOZDebVlu_6iH3E8WOwkAHdyYOciDW91C1F9WmG1U2Swx0
 WNnFeAZ_fXW5uPdT7z6gQOxk0Gr9m.6ip6ENMw9o6wmqO_g9XxV2oeCIc7zo4ZIUYoImgF.2nEHM
 5FmS7.SpR2sjUQt45Vpo4I6jKiGat7ZNOTFf4.UYbS0fMwW0wY4Z8VvCsnoimp2biSSiuwh0eMse
 aBdnQuZYtU8Ne7KdV.DRj01Sya9yAHThU02VfL7OdMuS.VtEmn7nMmRJFUNaOnt4ncSCYiKfm4kW
 cvVXqhRv_7m7347pIV1MJst1w.NeQlJ4nPz7S.zhO1bkhdgrsPVTXfamjSTvcS2FsaIiPGS8QdYf
 T7411XutiWKKDyZVDvKHYYCECKZuuU9U_8vW4.8yhHZzgWVE01ehKUXL46jhTl3Ipj2MB89Gb4ve
 vVkeeCHF.Us364bif5zmhHEnmRbqM5TzLKbYXGI6wknIA.DN4aFDjCMcRWjROWDwdqoj7O6woP2p
 XRquFMmsU58llK1RAnepDh0XKjWW3V..BifwfUPQfaN2x8OS3K7Aah4MwLJzFg2pay_w.g9RtL6p
 .A1JGgiYV83aX7pOKoThTvUCqoJ4I1b3fXHhntGQLX7h9YIqJ6L69fiHEOKsmAm8Ou13iCbC57do
 .y5bsDuTjh4tjtCMyN8VvTtFUk9XnXOZtXf.fs8YxapZ1SPqGj0W_p23Q5umf0cW3Yq9C0DZxyBI
 K_AfdzDjpLw2YFQJuR7iWma7EIVMwU9948Lyi34_BXdCA4VACsj6uBYNnRbhACkWL0ZKpjXW_vdu
 DSt6Yus3GosW5y3tsh_bxbwaMJZOjDLQBwdIrpaY1Az2trdxW26jfQONawsWekXjkaNTu_RgGQfV
 oVoTsmjsNIA30Q08Ww799CVcdI0HM0GQoJMoObCCKA5u8cRif8eDjJovGgtcWh1bxlIJHy6KvNIL
 B.3XEuP0jvDPv5Aqv_g.vy.BrKghaI3SQe9ga2FsK8BVgiWzi8ivs6U4B7A7iwqaXuP5IZIIi2xb
 9
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Fri, 10 Jul 2020 03:23:31 +0000
Received: by smtp420.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 3c08875b14f4e747f97ee43ba08a498a; 
 Fri, 10 Jul 2020 03:03:07 +0000 (UTC)
Date: Fri, 10 Jul 2020 11:02:59 +0800
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200710030257.GA5695@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200710023019.GD2916@codeaurora.org>
 <dcb68985-d621-6ef1-7452-172280148aa1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcb68985-d621-6ef1-7452-172280148aa1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.16197 hermes_aol Apache-HttpAsyncClient/4.1.4
 (Java/11.0.7)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.84 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [98.137.69.84 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jtjdQ-001aOt-Nd
Subject: Re: [f2fs-dev] IO hang due to f2fs checkpoint and writeback stuck
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
From: Gao Xiang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 10, 2020 at 10:54:13AM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> It looks block plug has already been removed by Jaegeuk with
> below commit:
> 
> commit 1f5f11a3c41e2b23288b2769435a00f74e02496b
> Author: Jaegeuk Kim <jaegeuk@kernel.org>
> Date:   Fri May 8 12:25:45 2020 -0700
> 
>     f2fs: remove blk_plugging in block_operations
> 
>     blk_plugging doesn't seem to give any benefit.
> 
> How about backporting this patch?

Yeah, also notice that

commit bd900d4580107c899d43b262fbbd995f11097a43
Author: Jens Axboe <jaxboe@fusionio.com>
Date:   Mon Apr 18 22:06:57 2011 +0200

    block: kill blk_flush_plug_list() export

    With all drivers and file systems converted, we only have
    in-core use of this function. So remove the export.

    Reporteed-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Jens Axboe <jaxboe@fusionio.com>

blk_flush_plug_list() is not an exported symbol for now except for in-core use,
as well as blk_flush_plug().

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
