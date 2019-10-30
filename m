Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEFBEA23D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 18:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tarwXS0zmNv8pze02F/FPIhlZWqm3er8yGZ9N4x3VRE=; b=L68i9y80J4EqUt+kfkER0Yazw
	bH1nbJpWFhfaBQq1e6Nqjic9j8ohGK364Q76y62ruxGgcM+oZvXHNn/UQQDGbfhAsi5pPa9aGE2mE
	zDB3n1Oz0pcFw+iX1Xd5chc6142S42qzyzAj58omMYFvFvJ9oxUyk6oVR9YbNV3sGZNrQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPrND-0007bA-3A; Wed, 30 Oct 2019 17:03:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@aol.com>) id 1iPrNB-0007b3-NA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a1fHgbV2gsxc/qTJLuC1KwVssDo9JDASf8CqQzhRyLw=; b=lNSz2/792LLImaB9C7eZELsToK
 vATXWa10itbhxqi2Z2wsDpU2c85us+/POdLssm040QzyfZ0rawsUsuWXspecFBybt+5PJYDImYsCT
 YB7hK3qbQR4qO03ygcSuEa92vVx9SiWTcRpjc96Ujg1VVKROHMIZ5/5GIt0BI4zjuAks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a1fHgbV2gsxc/qTJLuC1KwVssDo9JDASf8CqQzhRyLw=; b=c/DcdHg13qp1OlW98Dp2UezNoA
 rsxpG/BsHrfelPnm+sEg3G6TbJiG5gxuTlRNBn5HHusKfI+wBwZTMRktyshkFE4H9nZqRY2EeKzvu
 kw366yf4qS6DPg6gN1D4nEcZOKandSonE592oCMUtiqfjrj/O+Iu+YoBngCcdhQPQlBs=;
Received: from sonic312-24.consmr.mail.gq1.yahoo.com ([98.137.69.205])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPrN8-00BABf-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1572454977; bh=a1fHgbV2gsxc/qTJLuC1KwVssDo9JDASf8CqQzhRyLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
 b=QaTibODeT0QYR4zIRHr/bGvFMurkXoD1uzsTpwSNMTV4FeTgvrpvqNPvgDKpV93VtMcKZs7jeh10DI1MHvs0NErQevBKov+G9fIw+hmA4+VfgXqYo73o712APtFLKA+dcBp85wdLJKJcKeI+38HJjs0tZoNX0S5Hv9+hODDwdSLKNLbe/ysYEin9Ns4POZfMzMM7TDj7lPMOr5fQwLufZNFhjVl3qj2WbwgYJijVzbGFGIChiTDityLzzZkWAdrM93b1qnm+cCOpra57pr8eEwGo0GApiiWoTwW8B1ZfK4aG6LjKDbXCNbORJ/m79YlQtTzAyspgKmEM1lCbn2CfzQ==
X-YMail-OSG: xAMhXSYVM1mVFgtK0BldmKPUfzfYfyQA7hXB0tqZ1buoDcpRFjK1KOkXE2vDdku
 mS0_DTHl7uNhwfTABLCGEqL0IzWLVKrf4CUovUZqk_NWxgKv_DlmP1XifeCvCZF2LpzqOhcTJGLG
 Dm0nzWMyRflAODUEl3e1bTwZYU0gufWn0iiy6Mtgdbpk0qdOPePbPvw5N3tN7DdpZWo07zh6BO1y
 TjwZehv6xDg0ar1LvNVUVE5Vibo0FLKAkatJ3mudnOArjxx9NmenrkXhs0OgrW06HjLVB1cA4YcS
 dB3oZTncNajnuHRwgAtKhqUa7K9Dx2ccbwRZExzSkpx105I8Tp2CVVSxKoKt2MBUJj82GCpdkjcn
 DIye3PaZol8nQqKL7Du8XlYaxAcvsFT3SQaqoLsskRtHgspkORXw1V3_lRGMcac0_Rekl7Erv1J9
 3CMm8Q3WuUb7iR7j6nyUNIABWH1yGQpCl.jQPLqq6f6qV0DYOxE6My06TxLwFRtYYtfDe7JhrM9j
 25FLduRwdsIrD4KgiYcPWYYJoNFQf.BeFOgwv3o2cifm.cfBTc79EF.3oTdqIoe1JWVYYO0IH0A1
 qCSKEjKY0JucuM587EMpbHcqy8JNQO5QmN.T1QVJMkwizewftDr7gUb_PjbRDNSf0WzV3M69WlW1
 _CWKDPVagVJoKK6s2XF53muDbOUBeUgHtQzqAb3pXh5g3QqrLDLMrQ0fBjAoXknjMOICQsd9M2dB
 pLc.N8I8_AWdHq8cSRkD2CeG4EnCn8LcVg3WWCgu8XAVk14.y2OxNAv2lLJfEgD3nrS26a.jPx7n
 nwfm_9QWYpFLaa8TscbhLuaE4i5sizemvJdP01KTo8pTOr7z4CfEyuOgBdd50xVXe1ITLt_EnlnC
 PMZ6IcUhcsrnhWafvutq7ok7dm53F2W.OijwDHLFVLLoAXUbogEjmQo0NbP2GM4e__KItwdj70Xl
 YmioWc0K_w5kfxl7gc8BwHi.srO_qIWrt.jx7aXZlIQot0JHYGoydcghy15YQSOQPABZUG9FU5vk
 CMpwhvECKPzeXTMEWiWfg7c.isOMiHeo9Ut7tfP.45DFVu1X8EER3C.OSa9PjucAfi_x_9wLKFms
 khTO7eFSl1b5AeD.N.c9WXtTT5K2Xxlua04EWhh0jE5LFtPvBW9Heq7BaXqculhHYF.6GeTC0UrF
 rWR.0_ZRCe.EoZWHFtbzMMLRQW2.jbk4lB.3vf8BawbgJLTKbVf1Gy8EOTzL.ESFrVqX8RyHZX_s
 uKB.XmOE0VuIVL_7FOO8LgMjaWoRqUvoK0sPvriMxHLt3fORBmxUscWrrcsIhNbjOiZVLB84aX88
 jkCrYESXAJHZgynhHlaZ2sgKfG11MaPuSP8aTkufW7h8zg3aX4.wBJNRH7nAvgtiQa3Fzpg5bw2t
 e2a49yjXnEg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Wed, 30 Oct 2019 17:02:57 +0000
Received: by smtp408.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 39a6ce8385eb3b927ad40666caf4f5e7; 
 Wed, 30 Oct 2019 16:52:46 +0000 (UTC)
Date: Thu, 31 Oct 2019 00:52:39 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191030165226.GC3953@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20191030035518.65477-1-gaoxiang25@huawei.com>
 <20aa40bd-280d-d223-9f73-d9ed7dbe4f29@huawei.com>
 <20191030091542.GA24976@architecture4>
 <19a417e6-8f0e-564e-bc36-59bfc883ec16@huawei.com>
 <20191030104345.GB170703@architecture4>
 <20191030151444.GC16197@mit.edu>
 <20191030155020.GA3953@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20191030162243.GA18729@mit.edu>
 <20191030163313.GB34056@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030163313.GB34056@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailer: WebService/1.1.14593 hermes Apache-HttpAsyncClient/4.1.4
 (Java/1.8.0_181)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hsiangkao[at]aol.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [98.137.69.205 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [98.137.69.205 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPrN8-00BABf-Qv
Subject: Re: [f2fs-dev] [PATCH] f2fs: bio_alloc should never fail
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Theodore Y. Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 09:33:13AM -0700, Jaegeuk Kim wrote:
> On 10/30, Theodore Y. Ts'o wrote:
> > On Wed, Oct 30, 2019 at 11:50:37PM +0800, Gao Xiang wrote:
> > > 
> > > So I'm curious about the original issue in commit 740432f83560
> > > ("f2fs: handle failed bio allocation"). Since f2fs manages multiple write
> > > bios with its internal fio but it seems the commit is not helpful to
> > > resolve potential mempool deadlock (I'm confused since no calltrace,
> > > maybe I'm wrong)...
> > 
> > Two possibilities come to mind.  (a) It may be that on older kernels
> > (when f2fs is backported to older Board Support Package kernels from
> > the SOC vendors) didn't have the bio_alloc() guarantee, so it was
> > necessary on older kernels, but not on upstream, or (b) it wasn't
> > *actually* possible for bio_alloc() to fail and someone added the
> > error handling in 740432f83560 out of paranoia.
> 
> Yup, I was checking old device kernels but just stopped digging it out.
> Instead, I hesitate to apply this patch since I can't get why we need to
> get rid of this code for clean-up purpose. This may be able to bring
> some hassles when backporting to android/device kernels.

Yes, got you concern. As I said in other patches for many times, since
you're the maintainer of f2fs, it's all up to you (I'm not paranoia).
However, I think there are 2 valid reasons:

 1) As a newbie of Linux filesystem. When I study or work on f2fs,
    and I saw these misleading code, I think I will produce similar
    code in the future (not everyone refers comments above bio_alloc),
    so such usage will spread (since one could refer some sample code
    from exist code);

 2) Since it's upstream, I personally think appropriate cleanup is ok (anyway
    it kills net 20+ line dead code), and this patch I think isn't so harmful
    for backporting.

Thanks,
Gao Xiang

> 
> > 
> > (Hence my suggestion that in the ext4 version of the patch, we add a
> > code comment justifying why there was no error checking, to make it
> > clear that this was a deliberate choice.  :-)
> > 
> > 						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
