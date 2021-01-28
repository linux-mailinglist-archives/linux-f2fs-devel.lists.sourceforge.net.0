Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A8306B8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jan 2021 04:24:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4xv2-0001Sw-H7; Thu, 28 Jan 2021 03:24:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <enbyamy@gmail.com>) id 1l4xv1-0001Sq-MW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 03:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYYp98emCYbezQq/m91klUFEwQ6HOz/V/2yrmLptqo4=; b=CZSJq1JQsI4V7hSzx50r9hYoIe
 YMzNksv7jhVDxh7y3Eaoy/y8lXT9W3Oo4F92P8JkK68UTk8zeBnqm2bxAjpvZPa/AyByeliLsK/jV
 xK13Z4YPElcdyrAbprNO7fSqXWmjKyqwW7fXQqCpn2MyijY7Wt8f2yjm7XCZhy5wb0o4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYYp98emCYbezQq/m91klUFEwQ6HOz/V/2yrmLptqo4=; b=IOBINhGIDb9LNk8AB84CWsQWu6
 86uVju5zqQQdHoncB1xMZzUsbATwatRieq8egN+Uo7HwOPf7Y2i3z45IL2Cni1JQRNbEySg/UvuEm
 FsemRdVLWYMF5H9Eo5qxiMmR0d8RkrpMZFR/ozvlpjbiK5BBYHuCphvQz1EiupO8nskY=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l4xuv-0003UC-58
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jan 2021 03:24:27 +0000
Received: by mail-ot1-f41.google.com with SMTP id i20so3910526otl.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jan 2021 19:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYYp98emCYbezQq/m91klUFEwQ6HOz/V/2yrmLptqo4=;
 b=sTbRz3Fp8BxbEGcPcXFbGFBNj0QyTWronVAx9s45RhvLqwqMYvEgkeyYflthoHozF+
 aZYjJLzGDBKwwINye9XlLR+l8gkcn2xrHsegUFrL/3h92NSeuIIoWr2dC3EB/Yt3zFty
 Z6GhSRbAFDclKAbXik8guHiDYlduBdUjwkc7Zyn56n2yl3BGNTFldY2qMUzqNKAgZCAE
 zZZhuBGo9Ycp6pjDd9AOcEIMx0HlUPhkAq3PE7XvobdWM3t1R7Mh9lFjmvRYAC+vI2YB
 Y6ovslDTqG29U8Sf3Fw3NMht4PGl93juTer8P+o3hTe3uimKxFBGlRQ3Sl1BZ/zDwETt
 3sWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYYp98emCYbezQq/m91klUFEwQ6HOz/V/2yrmLptqo4=;
 b=FZbiuDSDbZc9OruQ1WBUklWOEE3Iq2z0xjDRNeqTEhdr/2b9G6iiO4LqVDWi0DDQFV
 xElOyRm+XU6966rkltiyhT1kPxCb+okTVoVWJO3AM6L6WzAXEg9G2fzUIqAhHqyG/7ZV
 zrU1qqy850qWJQS/RBZ5+G4aQRCDyxaPP9jtrcTYdLNfIoyDHqlT1mpN9QduInilkOsp
 vqwV7rwtQx4xuKu7fnzh2zIIWIeKStykbRcbfZJxgbH1jAVXJpkrTpEAED5tdiTm1IZL
 5IHlR1XMTXRI95+Tfk5dWt3ETdwzc4MFbCDp6MF9KuhdhrhHAlPtYeL+1hyJwTLYBk3D
 ZqRg==
X-Gm-Message-State: AOAM532yKmeZWqTyQLb8PxWqBx1VzpEfKaa4X2Dl+R4fHR08esV21DtG
 zuANrz3ULbEQCSKpni+LdECs1ouvdk/VleupnrU=
X-Google-Smtp-Source: ABdhPJyih9clxYo3kyGEyOQlrM1HWyH/2TRK4/OfMvA0o4ba/0wzoe2/UGo+qcT/FX27QsrzX+QfukXrDhFBwtVvXwo=
X-Received: by 2002:a9d:1421:: with SMTP id h30mr10327853oth.45.1611804255820; 
 Wed, 27 Jan 2021 19:24:15 -0800 (PST)
MIME-Version: 1.0
References: <20210115181819.34732-1-ebiggers@kernel.org>
 <20210115181819.34732-3-ebiggers@kernel.org>
In-Reply-To: <20210115181819.34732-3-ebiggers@kernel.org>
From: Amy Parker <enbyamy@gmail.com>
Date: Wed, 27 Jan 2021 19:24:05 -0800
Message-ID: <CAE1WUT7v4PTu2hEgDSpj+Y3f_Hn0XzOH3kO1-eYkOUgNun_9DA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (enbyamy[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.41 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l4xuv-0003UC-58
Subject: Re: [f2fs-dev] [PATCH 2/6] fs-verity: don't pass whole descriptor
 to fsverity_verify_signature()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 15, 2021 at 10:22 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Now that fsverity_get_descriptor() validates the sig_size field,
> fsverity_verify_signature() doesn't need to do it.
>
> Just change the prototype of fsverity_verify_signature() to take the
> signature directly rather than take a fsverity_descriptor.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Amy Parker <enbyamy@gmail.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
