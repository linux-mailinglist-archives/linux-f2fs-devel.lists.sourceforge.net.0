Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B92C4EA7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Nov 2020 07:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LG0xUSpBlKOoLrWuDOAlkQlQ18PZHhpHkfAoGRDcItg=; b=INpSPBCdQjJGYjie+8DRkH0N3h
	YeON9ILn5p21CWHgEo1Uy52MZosWYf9enzUg21rsbpqbecLdCgtFyDK0Cu/pIqya/1rBubt4rn1xS
	S0r18ln31VnaoTw3IxuKfnPD+dWc63HhEERzklY1W1sQ2DOwI/Zxy5Xvja0E23qr+DgY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kiAeR-00045f-7j; Thu, 26 Nov 2020 06:21:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1kiAeP-00045G-RC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 06:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=; b=GbMdTCrZrq81FyxxnBsAzDpouo
 nNDuWYoMDSsycThf/f7j7sv/2ajFRyfkv3iwJ+yV/DAyzFTi+mIh/6IgzI1N6z0DVUu4GwY5yjhD9
 ojY8ilrbJ4KXhu1eFGPd8kIiqdK26WA4fiInBw0cTxsa+grZcaAwA84x3/3jyfKqVdSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=; b=bFDpg/Z9dCUFkWr6ecb7m8AzOn
 6hjNy9yY/4uwnt4Qdnl1F6zUCS9OhZ/8Qcrc+EExW4+Nz68kpPCu+rMmvnOgNwNdfIeEFPMs7U6Yq
 C1ZnvwTvklitE9BnVjbaezcHPZmEUMx1qst2wgN6Ei0cobudu8ya30xKDs9J+eBqKk10=;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kiAeL-00Gk80-5h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 06:21:05 +0000
Received: by mail-oi1-f195.google.com with SMTP id w15so1108993oie.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Nov 2020 22:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=;
 b=ezaCvQHNP4rXVlX6xgXScBgYsPbPPYeNewlmWmduFOZEwCAQiePxmYmVXxRNWIAKBj
 npE5+8DtXXxl5lIDZZS0EJDFMin+cuNhqnF9GVWXdwt95ToczUH17XgI/N/f5RDdgVTk
 K20LAvN4Q8KwIAWKWxz7lhuudgoUDjDQNgOQ9wCJS5pv4UlJ8k6N+hip7il4Tw3qlp8b
 FAv350pYhHk1L7GaNKcFbR2Ti54nHn0eqb/zzb9ABRY2bdSGl5MHh8QN5HMKW/YmAQsN
 F/W7hV8uygULP8RYNfy2hBUXjRLteBmuEIR1j5uixtkiJBAM3lzJbujbvujPp0OydxG5
 21dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=;
 b=Lz+6denPVsViuWPfdxDHkRMgX+D7mI+yDfqpDeo7ARixwORxzpSlesJt1KfCdzf+K/
 AQbAHkfNnmk0k8bhRlTTurgd8HSfABzfH4ROKQt2NtD+gAsT+p4DwLVvZvhfgLA4Ri29
 c2yutVzjvqeR5hGg7i+Ddn0YuE4kq756HHq+ILnkOeIu92q5kGc1tgRPsumncFMd/fPa
 of4ph8Vc1lPzp2PZ3jn6azTkfmnSAJNheal2OlmFrcEWsQCyum2gqqrRu7hxiEy53EBH
 QjWc1E/aMWnLLuLvrlIWZrAYWKwR0SWUrL4F7woP22JMwO6VbMkLj0Y/o1M/fvkWiTbK
 A5uQ==
X-Gm-Message-State: AOAM532Vx/cCUwu8nsWbTE1YyFFTezamzoGgBf3YpBWde3Kr+eOfK+dY
 o6hvNcxnOTCU+c3SA0WZmPWBoRzFzNINP1+VhvwaLQ==
X-Google-Smtp-Source: ABdhPJyKkUGNp5ptVTQH/y3fdaO8WHD96bnV/Avp1SQ7JFU5f6ksIk+NGtCwlONjNfoJPAp1skv4dkqV7brJ0Qje4qs=
X-Received: by 2002:a05:6808:8c8:: with SMTP id
 k8mr1163796oij.84.1606371648249; 
 Wed, 25 Nov 2020 22:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain> <877dqbpdye.fsf@collabora.com>
In-Reply-To: <877dqbpdye.fsf@collabora.com>
Date: Wed, 25 Nov 2020 22:20:37 -0800
Message-ID: <CA+PiJmQ8-Qxu7yNWBvRLAeGa31PT5=hsYCcoW9QKsKnJQXqnMQ@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kiAeL-00Gk80-5h
Subject: Re: [f2fs-dev] [PATCH v4 2/3] fscrypt: Have filesystems handle
 their d_ops
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Gao Xiang <hsiangkao@redhat.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>
> This change has the side-effect of removing the capability of the root
> directory from being case-insensitive.  It is not a backward
> incompatible change because there is no way to make the root directory
> CI at the moment (it is never empty). But this restriction seems
> artificial. Is there a real reason to prevent the root inode from being
> case-insensitive?

> I don't have a use case where I need a root directory to be CI.  In
> fact, when I first implemented CI, I did want to block the root directory
> from being made CI, just to prevent people from doing "chattr +F /" and
> complaining afterwards when /usr/lib breaks.
>
> My concern with the curent patch was whether this side-effect was
> considered, but I'm happy with either semantics.
>
> --
> Gabriel Krisman Bertazi

That's just from the lost+found directory right? If you remove it you
can still change it, and then add the lost+found directory back. Isn't
that how it works currently? I definitely didn't intend to change any
behavior around non-encrypted casefolding there.

I should look at what fsck does if you do that and have a LoSt+fOuNd folder...


-Daniel Rosenberg


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
