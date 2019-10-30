Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23997EA26A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 18:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3m6zlidMi/kQVHRy5rk7iegM8aWnyocqGtbxVTYi00c=; b=cr0WMpOMDe9VQCOcYJEpb/Rla
	bWzMbSFpesAEGashxDwEuxlvJDx14v8AxbdMHkpwjHh5FcrTXsx4/J3KTM5tQs+wffXmp3RnRYZS3
	YQH+g9NYTUI4NmzKtu4nF7/CD8q46nMnkM1Dl9TEwIlIQ1/XmlhmSOVFCJ0eCKZRjBtTQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPrgU-0008Qp-TZ; Wed, 30 Oct 2019 17:23:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iPrgU-0008Qh-14
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kb4n1V0seA/ZgYHtBmZ8iV+zYnoNVd+L2wWX8RTfW1M=; b=Mxxs+nKe/18xmEytZ6WUXgi/XO
 BtfFlOLG5GVofZ8a9WFERGFabzlsYMKOurR+jk167JEwTDscDbeRKH5qKb+lAA7/71OgVLH53MxZf
 4nqd3tAZ0LUd5fMStfBSBAtuYdo+X1JwBoCr2gPBRfjYDg2G8r6RTFFQPIQgP4taaMI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kb4n1V0seA/ZgYHtBmZ8iV+zYnoNVd+L2wWX8RTfW1M=; b=PqX2nX4kEkPZXoB3i0K60ALL3t
 71uFY+HkpyDJoIfBTB7ThTFYvsrB8480KpG7vBRFRYrhd56UFTnMTfEAklyKP1BnFI4fk4nePAzFy
 zZq4OxlLu3AlamZb+brM1TeqjeGjBo5OZIt5OddUu1n+R6Q7qKJUPpi7i5G93SRTPVcY=;
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPrgQ-00B8XO-6j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1572456172; bh=Kb4n1V0seA/ZgYHtBmZ8iV+zYnoNVd+L2wWX8RTfW1M=;
 h=Date:From:To:Subject:References:In-Reply-To:From:Subject;
 b=Un1nk9EkHYaK0BMxOM2tsndHhH/1x7yC0PS/+NhGQ3LFO5nZPw5xTtjOruCj2M/rZTMW18a7omSDc3toddZXTQN8RLsp5aGtea9mAuYHsLVmlJh7YPVzO5HaFe7jzGc3q62eTbmCl/Agy8RToWDrzP0pJdFWWjm+RrVnyDpie88KuNvUISYkAxt9hMqBHOaJuHun2Jvko4G/FpJINmsvRIQxF6mi1vWYDIT4iwRM7GEQGmx1Q8/ioFomSEwdh0MRenk/YDpNEkRGuwp+o83xMD88bBZ/ybqSEF9qX7Ik3p2Jr4Y24F/VGHrH0aI/BRzE0le28sLe0OWz440AiTQgqg==
X-YMail-OSG: 9NV7YMwVM1li.vt0Wt_kGHuCLM6N2Rp7_uQIRZFfJ7mGGG.1e68Rtg8Ra6trvAd
 0T9LvpWHgRtlywhsGdG4YIBh2LXsRpT3CHlyuELKnHvI18e_Rw94OnJH9WtEl2xZ6_xBS6SYGZ2C
 BsreKwFbODvzvDarCJn3XSiXj8ne8RN2vxQ24ogdT5KoaM.ufezIc5d1X9dW7cyN35n16zJp9cSz
 dxXdCDKpK5ST3MKZIuwtOUFoTt.mPr22B2HdfLB2CaE.RCr5SjmNSoJsnC8oAe0wXP5A5DppDWio
 E886lfvRy3wBanP.UQWZBtHM50M6SnWKIr6HLEPn7.r4hZUI_eNRV6kF6fAzbXpSXnUiOxtCnVzF
 hHErg6VLrx286dzhFkHaBpEEDpXF8EZUyo.kX3gqxxOD4RkcmzocfHVCeik.ukZOmvEzVPYG0z2j
 Znlk3noB3pXf2nyw5JFcte8cSn.HQ0r0BtFGfRIh0mdLoLMDTyDJZZmUl1arQc_Czi5AxqPcxzHJ
 KXwl_7V_lmyPjbVP0anKSX4AkJddT455bEEjdlfKGQ8lcKmDEGCyjENOCLc0MIzx6kenTbeGJpyX
 o3ofVD9mPGAPGY6kFoE.WlHEeXXqyv_nJ_s7UaDzPLri0ddtt.5gKHpH4Q_5Clx65SWFrLWyh7ho
 3cm5guUNcFaddNsbqmSjvXHeAjIO4zsJGkrbUjVJKQdSCv3fEPcNvHUkNQlUI6LrEiyZxiaBylUK
 9d8mpYHtW0NXsg83D3EJrZ3M19q.eq8BkSmGcRtku8h2r7GcBcmeWX85HSlJ0w_HcpmIDz0g1S5S
 9XsWQovO7r5EhpY67TBnbbmoYCVk36asjR_gDyogp.06Y63jhD_UHnNWSbN3Larh_CUXMz7TPpTs
 GrNJiTCrRDPxiNUq9ia6FsWNZ4Eo6hD90fiSr00uB9fTky5RPGXJ4ilnRcSdhiX6j6BmfoT_Tvfv
 VsnpNrWA95JmH4ktnyE46.jJWl28x46suX2eW8JJOrsyZgt5vPN6Cq6gCXnPLkBUTOtAQISOTfGJ
 y__BWhFArZgROHVUwyAJjmZFBigK0GInRhtSmqz8w66rYwZzOaeGUOTe13S4GSdpxMhwiH2SvsCi
 PKFwpYaxGbehsb9AbS_ccC3QVhiZyNgjeqONh5t1SMncpNhck0JSjkyJ0pc7J1pMKvmSZ5U.QkKz
 0zyJ3pqnKCi62C2J0q6jFKjzC.FYsO5mZDDqcU2axUh8GhsVSu.zBW1NB3SUz8j5_JjqsftSewFS
 V5rwJnDq7JAvY6.35Br0J8USDelvfFLxVxTuIfC.KtdTx_DqBSoPnqvPNTjCwZxxOJx2HipgGEVA
 vqKtD36H20RIuHquq6D_5FKxsfd07ESIuINmMsMGVPQc45BAgeIhYVMq4E72.vbcHEW8ra5PpVOA
 fKEmF7TLQVw--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Wed, 30 Oct 2019 17:22:52 +0000
Received: by smtp415.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID c6b74f9a96653bcbb72edbf42affa5a8; 
 Wed, 30 Oct 2019 17:22:50 +0000 (UTC)
Date: Thu, 31 Oct 2019 01:22:44 +0800
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Fengguang Wu <fengguang.wu@intel.com>
Message-ID: <20191030172234.GA7018@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030165056.GA693@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030165056.GA693@sol.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailer: WebService/1.1.14593 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: bootlin.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.68.205 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPrgQ-00B8XO-6j
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

(add some mm folks...)

On Wed, Oct 30, 2019 at 09:50:56AM -0700, Eric Biggers wrote:

<snip>

> > >>>
> > >>> It isn't really appropriate to create fake pagecache pages like this.  Did you
> > >>> consider changing f2fs to use fscrypt_decrypt_block_inplace() instead?
> > >>
> > >> We need to store i_crypto_info and iv index somewhere, in order to pass them to
> > >> fscrypt_decrypt_block_inplace(), where did you suggest to store them?
> > >>
> > > 
> > > The same place where the pages are stored.
> > 
> > Still we need allocate space for those fields, any strong reason to do so?
> > 
> 
> page->mapping set implies that the page is a pagecache page.  Faking it could
> cause problems with code elsewhere.

Not very related with this patch. Faking page->mapping was used in zsmalloc before
nonLRU migration (see material [1]) and use in erofs now (page->mapping to indicate
nonLRU short lifetime temporary page type, page->private is used for per-page information),
as far as I know, NonLRU page without PAGE_MAPPING_MOVABLE set is safe for most mm code.

On the other hands, I think NULL page->mapping will waste such field in precious
page structure... And we can not get such page type directly only by a NULL --
a truncated file page or just allocated page or some type internal temporary pages...

So I have some proposal is to use page->mapping to indicate specific page type for
such nonLRU pages (by some common convention, e.g. some real structure, rather than
just zero out to waste 8 bytes, it's also natural to indicate some page type by
its `mapping' naming )... Since my English is not very well, I delay it util now...

[1] https://elixir.bootlin.com/linux/v3.18.140/source/mm/zsmalloc.c#L379
    https://lore.kernel.org/linux-mm/1459321935-3655-7-git-send-email-minchan@kernel.org
    and some not very related topic: https://lwn.net/Articles/752564/

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
