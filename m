Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1C3D1FB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 10:15:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6Trk-0000Pt-PD; Thu, 22 Jul 2021 08:15:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangshilong1991@gmail.com>) id 1m6Tri-0000PM-9R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 08:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CB1DhhoIrWZ2u4W7LFw9hU1lA3h0TX8k9+TK23TIXls=; b=Jyta69lzBMgw71cYCCmDZhzth5
 LqxQl+/17B959uc3zI3HxtKETO/fIKlQxmTNzP1j6hQfb+osz/+YhxCE7BpeLYd0lKpPKtQAqwUmT
 uXDV9xcvqnRo72D2IhF1thmwxuTx+DpbGCmrB639YWnBawvk0jwF+H+JmLg1+SRKu2mg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CB1DhhoIrWZ2u4W7LFw9hU1lA3h0TX8k9+TK23TIXls=; b=RbJYv0yQoohtck6cHAVNOn7ESl
 gJMDNU8+WvgQvYqoAlSrq2w1sWQdZaZz1U35feqyKocK4dtXHEeFAfnKAmASGJhO/MVvu91gtD9Qh
 Bfl1IjucNkH4kjZNvloix1JUdCuRcQ35903GX2kV2eTns1eR78u3QV30Ww+EbHzeJN/0=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6Trf-0000iS-0o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 08:15:34 +0000
Received: by mail-wr1-f42.google.com with SMTP id d2so4992516wrn.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CB1DhhoIrWZ2u4W7LFw9hU1lA3h0TX8k9+TK23TIXls=;
 b=NKSGar6024S8fjlqKdxqo7uetI0k/el2vdVuKUbYIqQkIx7epBvdv69wqTtivfh3cc
 +k4CgoFsQ3AZts6oEcz6oYbdWprwsyXShzxtDfZNO/+7TJuRcV1bXIvo+AD1/zO0xm35
 x/8I2+GAxigfX1hM6XTSyZj3+WAofCP+9K1pXTbQ36qOmEr4KOwI2+Cb64N/51h+DNgn
 EeLETWVsffqljiFuNQKR5korTSWclghsbdhCoc8g742RSxCvbSVfkCtnXXuMh0fwMmdb
 JHZoa/noWDC2iC5XD2WwTOz/CnvxNvxFMazLk9T294q/eSxWr+G0cmzVBCtFPfIzGXiK
 nRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CB1DhhoIrWZ2u4W7LFw9hU1lA3h0TX8k9+TK23TIXls=;
 b=AlIZ50dMuMrXTZ4GWTZwQi4uhR59AT+5BgkXhLkW4McPXmckcZOQh39o02M+LUXYoR
 og6ZjJCCDgI9nvJWpos7sM5tMQjK/9qx8HJi1kEc9dTra2C8VFZB+IY1RnQEOWGII3RB
 DS69pGLAvTRgAyEHj7WwGTujxfXXGZPCgLu8L9CGUqnIWhv1JLNi+h6qLnEsgPaYN31l
 QUynUqAqZjU2KBzhZOFVbU8/kHJ808eR4XpQSOSGUS50mNd0XBfsheda37CSwvI6d6hY
 x8PYf2pLffNLvmAs2eYV87NkSvNQu51WbkvuYMAqretJVy89w/GL+M6zKYVoaoywkuZE
 my0g==
X-Gm-Message-State: AOAM5313hfmuoxQ7cd0KjK56blUSMxL+8FgLznUVzMdg7rab0BGGi/rn
 To1ph57LWaTrEqSDUJ99pphPjjqH5JHgGz0gLZQbNpRzfNM=
X-Google-Smtp-Source: ABdhPJyFh4EkKq2jcgqpXacFax1D4snzJyjJDqXuDSQpcR3EzS/pP2Yv2bHfRjXl6gTFPkjEOSvauSeYcCHHSWqhXWQ=
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr47833962wra.291.1626941724710; 
 Thu, 22 Jul 2021 01:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210710143959.58077-1-wangshilong1991@gmail.com>
In-Reply-To: <20210710143959.58077-1-wangshilong1991@gmail.com>
From: Wang Shilong <wangshilong1991@gmail.com>
Date: Thu, 22 Jul 2021 16:15:13 +0800
Message-ID: <CAP9B-QnTvphddfafS310RD41Jc_tNM1Wvm34eWhZVe6VT5g3Kw@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.42 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (wangshilong1991[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.42 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ddn.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (wangshilong1991[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6Trf-0000iS-0o
Subject: Re: [f2fs-dev] [PATCH v4] fs: forbid invalid project ID
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
Cc: linux-xfs@vger.kernel.org,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Wang Shilong <wshilong@ddn.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Anyone take this patch to the tree? maybe Al Viro?

On Sat, Jul 10, 2021 at 10:40 PM Wang Shilong <wangshilong1991@gmail.com> wrote:
>
> From: Wang Shilong <wshilong@ddn.com>
>
> fileattr_set_prepare() should check if project ID
> is valid, otherwise dqget() will return NULL for
> such project ID quota.
>
> Signed-off-by: Wang Shilong <wshilong@ddn.com>
> ---
> v3->v3:
> only check project Id if caller is allowed
> to change and being changed.
>
> v2->v3: move check before @fsx_projid is accessed
> and use make_kprojid() helper.
>
> v1->v2: try to fix in the VFS
>  fs/ioctl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 1e2204fa9963..d4fabb5421cd 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -817,6 +817,14 @@ static int fileattr_set_prepare(struct inode *inode,
>                 if ((old_ma->fsx_xflags ^ fa->fsx_xflags) &
>                                 FS_XFLAG_PROJINHERIT)
>                         return -EINVAL;
> +       } else {
> +               /*
> +                * Caller is allowed to change the project ID. If it is being
> +                * changed, make sure that the new value is valid.
> +                */
> +               if (old_ma->fsx_projid != fa->fsx_projid &&
> +                   !projid_valid(make_kprojid(&init_user_ns, fa->fsx_projid)))
> +                       return -EINVAL;
>         }
>
>         /* Check extent size hints. */
> --
> 2.27.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
