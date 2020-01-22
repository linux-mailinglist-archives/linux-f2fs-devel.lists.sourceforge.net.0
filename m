Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75489144942
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2020 02:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDgqvs8k4xRlcM12RAK0XnUjVINBOShi3TxzT09Jq80=; b=deNtBJM72r0ht1bKC8DQ8FlB8j
	0zUDKWgWAnSkB7+lsF/+sgjDSxbN8HUrbP0wi5a5uSzB4ngbrq4/wo8nCrBnVlLKcOINBghHosejK
	7PvXFKqWEHU4Y+8EpgjXY6FBBp0xeJnQEaK2tM+tEr1cNRkF+eYjoSltSJqVzbKRqPbg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iu4de-0005Ty-7g; Wed, 22 Jan 2020 01:16:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1iu4dc-0005Tr-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 01:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=; b=KwwGUKpQ3zomLHW4PQa3lBbENz
 qH6CT9zY7mfjU6Zw4Vm0K8jydXxdIutHdMY20dc9kMnFnRFmx+UTL/jOt0WSyC5zCMABfB6GYs/Cu
 h3wQmL2RnpM7esiNHGsPk8RvIZix+qR8SiN/WbXt1dZpnGmk1QyQwe5Qe3/uDchvibUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=; b=G9K/qW1cdaSVC6JEHdDarxTpQY
 AcGEbKN1ahwBLbiklfswjh46QbQbjpkipOHfr+XKrGr9ItGmLxKlQ/Y+w9aZrJ+UAabC/rAJIXzyn
 Vewj0WzSVHwNqk0kH0gXGlOR4MJCB3RtuCc8upGOOY0/+BZ0xzf2VszMr/uTpQOTh8c4=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iu4da-00H5L5-Am
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jan 2020 01:16:56 +0000
Received: by mail-lj1-f196.google.com with SMTP id y6so4927759lji.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Jan 2020 17:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=;
 b=sbjgI932IVsBnwvZcFBnekfHjH6LPvKho84iI0IqHn/lre/vnHDKZVHxM1chNODhEO
 oeBlWCXMu1xE41wCdmoAkJJWr3Xo/D+ju9vZ24VZpOnhSgfRdcQ5am2PHHrxTnbqi0XX
 b6eAwer8WCvSMIGV6+9Wm90f1KZ3856dgqPB2hB+SbeEq0VAirrYLusuJK6x9OvIXK1e
 QDAc9rab8nWgGfMDGKUKmikIqpQ1Tb6qVVp8u1rUGV3i6DXFmO0XieZmSerhbsGxj1Kd
 Nom76vDbxrBnAL633zaFY9rrVrFB9Ton5m1jJHrUpOo8xzUYC7WMuWNZ+fTJ5iMxzctH
 wfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTrmpDPbM7QagWgFbn/XvaDbssQKCtZ+aK7kQ78b1YQ=;
 b=AkJelnDicGjJK23r2upVDPTHKYs1lU2X02g4/MBbk6FacdCothVaB18z0bp0EGJcUH
 ZE5pZ2XUP0HpKAkEYJr55TBBNzNlqeQdCV+CbR/krkLc/gtlGcZy1y9cvFliKol8a00h
 J2KIMCZ2dJK7S8atQRzKuYbyxY8b42+rqGviiTkc7PKuXUbq4sBY2PJEv16rv2J3YQET
 unWPuMBh8iRxt5Zgn5tAjis1Prt+r+xyV8XJpr6C9F39uOLP2vdraMSifOoQodbPyB8g
 L+t+HNR2Jb9TI90aS/XOAR6P78yfb/zidgdBq1G1lZKWsDnhJERjf8GA2B1UCORdVwsK
 KGNw==
X-Gm-Message-State: APjAAAVcMrVFBIv9mZv07zXIg86DYznQv5XZ50SR7zWL046OTcA8X156
 NQOqEZubt6EZGWI4VhmwkVwYJtqIHaJ2s2zTM1wXCQ==
X-Google-Smtp-Source: APXvYqx9Wcig2VJsMhSPvoP5661qvRVt8CMWdEp0WvbCQ34genipkG1eA/ei4esFDAtnsgj2YEIbFdJHl+MGczi/Wzs=
X-Received: by 2002:a2e:b52b:: with SMTP id z11mr18133901ljm.155.1579655807322; 
 Tue, 21 Jan 2020 17:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20200120223201.241390-1-ebiggers@kernel.org>
 <20200120223201.241390-4-ebiggers@kernel.org>
In-Reply-To: <20200120223201.241390-4-ebiggers@kernel.org>
Date: Tue, 21 Jan 2020 17:16:36 -0800
Message-ID: <CA+PiJmT1GPgLBYak51V04jtyDjOFPzSeaTxKryCqy3Ak6yAo6A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iu4da-00H5L5-Am
Subject: Re: [f2fs-dev] [PATCH v5 3/6] fscrypt: clarify what is meant by a
 per-file key
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
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 20, 2020 at 2:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Now that there's sometimes a second type of per-file key (the dirhash
> key), clarify some function names, macros, and documentation that
> specifically deal with per-file *encryption* keys.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add
Reviewed-by: Daniel Rosenberg <drosen@google>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
