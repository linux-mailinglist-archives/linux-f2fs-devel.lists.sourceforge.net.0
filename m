Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522459AABC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 04:39:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPEOv-0002vL-LM;
	Sat, 20 Aug 2022 02:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oPEOu-0002vF-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I9L8UVtqMaCh8C7Ugp4FE96IRIhMXTQApQBBQyYJU1c=; b=Fek+GHGlyeK8L/zGa86PUTBkBC
 2XrDVymBffWOodsrpswxj/ZOQzlSAG1kzSRTij4RDioTY8zutmmUc4Ch5oYhd+H3xhdHVPmv2cXhk
 9YGT8ho3JSVrXLsIPRvhZXv6njskJmY4V79zvE6Jc4iXQ/GJ8CUn7RcLa/diYAqTEYiM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I9L8UVtqMaCh8C7Ugp4FE96IRIhMXTQApQBBQyYJU1c=; b=UD7A+ukZZtH25L5IykzUvjawDg
 EE5b2fT+wZmaiSKt1GNaReESoMdrdf5duur6mme2o9qOIPh6C7YzjWq8nq0x/ZybRLgYZUsOksDHq
 OkEt2c5z3LdfRJ2P1RWSJaVmiBG9FcIQmG1E8iQrUk/Kgmg2YnyRECtGmN90lC/kBNlM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPEOl-0002ed-CD for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:39:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3ECA61952;
 Sat, 20 Aug 2022 02:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFBBC433C1;
 Sat, 20 Aug 2022 02:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660963177;
 bh=iH1pavw6wGlgv07NQq9XNjQRZrUdrB+HqyoCKsTLZj0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fAtgHZIzgi0xHlh8MIWZqqowRAVXQuWrpL+CG02PYeoXpbDi9zKDtSua6q1Q7NQE4
 K+T/iQoEsbccQDhZxlXVVH52SZTpaD8O6U4iRJAYxJERPiFElCQeo+oYVHG+tLG8ZB
 Z+QaUFKUXj8LqXKXwSr4bPts95d6GGEEX9tE/Aq5h9Us3t+mWLlYuomRESsBptLFfJ
 ch7Qrk6SV4se//YlthWK2wlgLf0zsQ7PTzGfai4+iQUNk2pPdMo8Ag+/Syg7iq3SK5
 LiP48Wyrb8CosTHoZXe3o68khP7UU4jm+dahjJgHGM8oZROHyTEc58mPBH13l/6MAH
 AMvb8nVOkpfRw==
Message-ID: <a2e3faf6-dedc-7ee7-0b08-8a5f2bfc2d25@kernel.org>
Date: Sat, 20 Aug 2022 10:39:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20220819223300.9128-1-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220819223300.9128-1-ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/20 6:33, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > This is simpler, and as a side effect it replaces
 several uses of > kmap_atomic() with its recommended replacement [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPEOl-0002ed-CD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use memcpy_{to,
 from}_page() where possible
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/20 6:33, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This is simpler, and as a side effect it replaces several uses of
> kmap_atomic() with its recommended replacement kmap_local_page().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
