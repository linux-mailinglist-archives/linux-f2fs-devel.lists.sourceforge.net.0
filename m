Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C165A1F1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Dec 2022 03:51:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pBRy6-0002vf-8K;
	Sat, 31 Dec 2022 02:51:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pBRy3-0002vV-Uf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 02:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u/EIFfciYfy5iem7mQn7nu83XeMSciE8lvKny2IDxfA=; b=EhkBKFO1n5gTRWbt89oU8XhC4p
 nG09lT15mQPtBVWWsgpZ2B1x7L/fUdKmghGnPFq91StURU1qhmJzx5M+nsIAfr9pTUfO9kXZ8rTRj
 0EEJCY2yxuP/p7CzdHFAOu+bbmmwH6h2WAlXMxHBi9z2WlS3ycdBc8Xa222oWPOuz0zA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u/EIFfciYfy5iem7mQn7nu83XeMSciE8lvKny2IDxfA=; b=E3dsc3eOQh/yhO2xB/AuaYCRWd
 BxrgvuSRbAY1Xn6WN0qb1Hvniym1xKkrK4/fieBkNXKDbIH6HaM62Zftktm8JeAcRizp2OJPxOi8y
 J3OR0q0+00FZ/kJ7HZuMLuby5N6Crh0lpeMAxJiP05mdYT6Du8CZZrzVyUyg+vOe0Huc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pBRxw-0000wG-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 31 Dec 2022 02:51:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E672B81E6F;
 Sat, 31 Dec 2022 02:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB09C433D2;
 Sat, 31 Dec 2022 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672455066;
 bh=0A42kWkIs381juGuLpCG9DoytaGwDUdX7uyHrnK1/SM=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=OR6sYtogoecFKH1Lqk1l7qtiTfHpuGgWLVZqMEO+W8fUTaSN9aT3kHNsDmAf9FL3I
 4JYhdZES+cRYjqX+nMmP3+HLfqOTcLGIZUP5w9NbrwBorpX70WrY80GA9CrbO5g/e4
 k9/Xu8Q574jMJyNjjeky22v7PESePViY1+FYXOxX1XmyWQ/hEC8r+IRUOM5GV8s2QP
 CPzoSSDmrK6HEEbrc+2ZO8XdVDSOGRWzNc7IDFqacBttgbL84wmgta8p+zstxWRexf
 iX86806B09kdxhidEWAI3z4hfgjRxuc8OzQj9Fu6ROCmayuzkg8gXcm2CeGrvKlDmV
 +MkeCwRLY6XLQ==
Message-ID: <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
Date: Sat, 31 Dec 2022 10:51:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jeff Chua <jeff.chua.linux@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Eric Biggers <ebiggers@kernel.org>
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info>
 <Y66Hk6waTeXQDz1/@sol.localdomain>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y66Hk6waTeXQDz1/@sol.localdomain>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jeff, On 2022/12/30 14:39, Eric Biggers wrote: > If you
 could provide the mkfs and mount options you are using,
 and any other > relevant
 details, that would be helpful. Bisection would also be very helpful, [...]
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pBRxw-0000wG-Vd
Subject: Re: [f2fs-dev] Fwd: f2fs write error Linux v6.2
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 lkml <linux-kernel@vger.kernel.org>,
 F2FS Development <linux-f2fs-devel@lists.sourceforge.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jeff,

On 2022/12/30 14:39, Eric Biggers wrote:
> If you could provide the mkfs and mount options you are using, and any other
> relevant details, that would be helpful.  Bisection would also be very helpful,
> as Thorsten mentioned.

Other than that, I found some cases which can cause similar issue, so I figure
out a patch for possible fixing, if you can have a try with it to check whether
it can fix your issue, that would be helpful as well.

https://lore.kernel.org/linux-f2fs-devel/20221230154332.5082-1-chao@kernel.org/T/#u

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
