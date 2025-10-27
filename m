Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E96C0D75F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 13:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ft5nCr5pt6Lgf+Pypn0ZLx4LP4xEKWKhrX51KuYQfXk=; b=bl2wIZ8X3OVksbEiNzJldy8fJ1
	2Nkpbir//lCZWlXpNEQ47cH+se+K/UL7wt7HBOpcEt3QpTt1bUZXBMxNVgYpQTtQ64b/dyX7vgN94
	2P1iHmH0yVqUZvFIPPa/20mcyix+/07WWVORGx1s3iEu6hu3le2r0L0XyPZPCckL2s98=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDMAF-0005ip-QI;
	Mon, 27 Oct 2025 12:17:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kartikey406@gmail.com>) id 1vDMAE-0005id-J5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zTMqqkMnO6DYfa7+wlhQspHetXrQiIjWiWLP7Cp/77Q=; b=U3kgeiIXdfm0mGbyB6os+4l4Ko
 8u/hBY0e0kdr0ZIn+eEDtxSKqtWlMUWG+kPNF5+MDwLmWphNyAH6bTUSPnG21bkHVtaSwpaGXoLxJ
 NCtt49mqNCpYF7VKGt/kJeNRY8apAz7JxfjiHFU8Hq3bEGiZOaFEo6nfyQMQejlHmH1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zTMqqkMnO6DYfa7+wlhQspHetXrQiIjWiWLP7Cp/77Q=; b=ahL1WminozKecfekJ5bfqOSF+f
 NnHNtVOvEK/8TPulNSEg2K5YMBqKEicQZbC2zZVtGTsnf/+Go7Kkk57/DAZFXvYOfUvDDp7TODZXd
 pOkWJ7UfGoyavkhodm6ghEbPedGoRKWiy3KQ81w9qcQIXmTZx7mzfGdUzaKLee0lsHMg=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vDMAF-0007hQ-02 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:17:31 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-784a5f53e60so53668827b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Oct 2025 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761567440; x=1762172240; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTMqqkMnO6DYfa7+wlhQspHetXrQiIjWiWLP7Cp/77Q=;
 b=gKw4BEByUHT421dt8oK+Y7rn8muaiJWckXJtt+gsdv3ybGahJ26cnUc8X8H3YDs9aw
 K2J8EbAQ+UtiY/oaPrsZYbubtmw31wzYXBme41tv+D1xNLhdWei2R1Z3UychVsqySWnM
 EY2ri/KyH+vxsk1mpIKjjacsiZGkGPiSze0svPxtbBeo+jDqQYKM77EOUwlTgYzk+h4h
 cwXmIkgPBTOyE2q/IS47BkzRj6KqnbvvdW2t8wF/AR9H+EPNhI6BX9qu+G4Obti9smBs
 t3aXk11/euETQw4kc14OAouOIsccCIQEBLxBGM37+AAWHZlLpBIWH6uMHomuKAW1FXdV
 aqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761567440; x=1762172240;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTMqqkMnO6DYfa7+wlhQspHetXrQiIjWiWLP7Cp/77Q=;
 b=SR5B12vB1Lr0KLtIJbf9S01OuriO7wTgzQ/iFTyq3Is6PHTx1rRQYVzhvpj0Xn4Uuf
 I8lOe4qVKQlwZIIu+lxudaN+0EcyVju3uQfF5OmbgAybYpMtQimw+F1/xAR5aMiMziie
 3XlzE6ayFfN2hEKf5q9HPq4sFx+i5BOAvdY2Xu4hnZ5BQKKM6EWmpzEpgkYygWYlOGCo
 B7rdKru6AYrIC0JeGUAMXStevE/SYL+xGfNENrQI3FcN5mEbwRQKa1yUOHXYvVq/jSpT
 xTFirattC5ffB2OB+xhcg5AYqQ1gW4yls0IVCqpm46XmLA98FtaZR0lpAzeWgxgFIO3a
 U3ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmYx/jdiZh0ATKeZzXd9cWjY0MVREP6F3QsZLu/NEAMva7AUIvNs+mvy5Eq0F8WezHd5LOcnoBTXgLUIfYzR+F@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwPJDBChPKNdGJTfv1jsZn10rtCJwYNVv2wKCoUxn4R1m0TCyOX
 KcN2nLijCPn+BCQz3EYEOaHCYms1mqwujni11ddTQIWdDy7kFmf5G2kbxMtAn9TvTarjyu1HSDJ
 2xEzZt2KPWSyERIFOJ/WsOMCLjNNnjCg=
X-Gm-Gg: ASbGncv6XWTY92QHc2sD5Fi/+ICqatLo4Dn3U0xvvRiULDn8hTPlebCP7d/Fz1KKqNH
 7VUgYgy/19t0ApU9XoaRLVAd4/huBj+RbRdWuSrkPTNO1Yi60G+yiXogzORvXpOG1svx6jxONBZ
 EVMI+ieHp4VoLCbzLq4wODfjZAYxA3aJhPhi8EghYXHPvEptAOchiJ0hH4sUD/lSQYfSPBKiiBP
 /md0xfEoc/OX9V7rFH1iTtAK0Hwt36WzUNZfacM5qARLa1ARhYhggRWeU0tUWxtsP+GWbRP7k3A
 CeFJEvUE+ciJg3OlvDhxxTsxSfs=
X-Google-Smtp-Source: AGHT+IG0kzSdAtGvyFWMugmV7li0vGK3UizGnZGsojmO3U5HNvI62Ga88zD88oT5E4T6A7CSPsvXRUtXprI/QpkXSt8=
X-Received: by 2002:a05:690e:d4c:b0:63f:2b0c:2d61 with SMTP id
 956f58d0204a3-63f2b0c2eabmr14253696d50.60.1761567440143; Mon, 27 Oct 2025
 05:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251022233349.102728-1-kartikey406@gmail.com>
 <a6dc6438-7aaa-4c21-8df7-ecd618b826ea@kernel.org>
In-Reply-To: <a6dc6438-7aaa-4c21-8df7-ecd618b826ea@kernel.org>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 27 Oct 2025 17:47:07 +0530
X-Gm-Features: AWmQ_bn8933_qT8pmIytRPY1lqL6cDkWjTmzyPJlqvt8RXmy9dnm-zFuOUT2Yw8
Message-ID: <CADhLXY5RomCGo_xyBuWdRPP=qgudkdcxoSRd7xp09M0vGTBVNA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao,
 Thank you for reviewing the patch . I will send patch
 v2 shortly. Thanks 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kartikey406(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kartikey406(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.175 listed in wl.mailspike.net]
X-Headers-End: 1vDMAF-0007hQ-02
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate dentry cache on failed
 whiteout creation
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
Cc: jaegeuk@kernel.org, syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

Thank you for reviewing the patch . I will send patch v2 shortly.

Thanks

Deepanshu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
