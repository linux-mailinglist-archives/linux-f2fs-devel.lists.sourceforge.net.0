Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C16FFE51
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 03:15:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxHNE-0008FG-3L;
	Fri, 12 May 2023 01:15:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sijielan@gmail.com>) id 1pxHNC-0008F9-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 01:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PmgiL3YYms4pueox3E/9WSDCVvorY3CYCoareNN8U+Y=; b=NXDVajp8ZgRRhcXBxCf34/9aun
 9vAg7BkYFKzkQWUqwjHddtWOIVXCw9aD01DLEds5VTpJz+evuWFEL6qi9Nnlw3xcJomaUH3rtgPHU
 mH1qfgMb56/Y/30nwTfRnd3WvW09C6j8PJPmHZq9uEzlarBMTCvfuM+k2XAXXrDGn6Gc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PmgiL3YYms4pueox3E/9WSDCVvorY3CYCoareNN8U+Y=; b=A
 7E14lssccLtiy6HIPF9e6NrC8PhLpVXW/yWUXXo2JRkRZdBVHidaMUp8s85h4TZ/Jc+7wAUlUbwRp
 XLr+6kiYmB056GVO/cdLCY2cBzrLeTqfz4UrBmuVmL8h+dRtQ9b1aZVPtDS4e1hExVSYzGQOmcD/1
 HSo83rqbltNJJnf8=;
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pxHND-003wtq-4T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 01:15:07 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-55a14807e4cso166640507b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 May 2023 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683854101; x=1686446101;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PmgiL3YYms4pueox3E/9WSDCVvorY3CYCoareNN8U+Y=;
 b=acnZG17EHJKzJ7LIGLMb/VPxDjPDvQXgCnTEaUxlCti+GjJ6Le6+b3JepCZes0SvoZ
 pFD4nWt6mPWP0b0ZhVdRIlVLUIenTxCboVzZNA7uPgfe4JviSaqmkXeMGBzeDgI29W4v
 q09Wc0WITh7/E9NOkXIfC2/NN5l6InNGAPHR1QcfF43dbUxjxv01CQiuWkc5JsebgGGe
 soxPsTi5Abyv/UFTMHP440wRrKhEzp/MUVg9tqEppg1+Jxaj7g22T1KrJCm3S4RDKpiZ
 +jWtx/qRQk0FLy1JTdjBCt0W4aHb6KtjWKLtKnVVYeoSm6HSManmtSEl1S7lxr6GFa0U
 mB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683854101; x=1686446101;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PmgiL3YYms4pueox3E/9WSDCVvorY3CYCoareNN8U+Y=;
 b=W/SbI2OUHwOxiUhGxzJnF/52KEkxO3+FOmJZZJgz5KSkeXsmnQkra5Xj/qjZaDh1fA
 jMvokOmQFDYlmuy2M50dypv/N/BZHcjyk+8lKdfRK+djAMuVYgVRpVHHIZ1kBZZDENgc
 l9HerEcKgjOzz8DTtmZISXXXkNcssmU+2a46Axi1BIXWpRor7tGDtIRJyw0I39HGnFoD
 6oo4Z723GgtPlzImYHRJhfvPezvXnD025pCIBg3IiUPNz0JjXVCGKkGhviJ4iTA8GHrz
 3xjDoNcvTa42V606CBDDzJykySKG5fEGinvBwgfjI+/yhNiTH4jmoz3yuyc7feFBlMTW
 gZrQ==
X-Gm-Message-State: AC+VfDzAwebrsGel5J7r9drAGfH7B1f2mzpqj5Doh8RqvEDhPIgJ1kty
 9ARzV3X7EFUJ1V6Q2wpFNyqgSosyAxssnyDP7oKTF6zvjpw=
X-Google-Smtp-Source: ACHHUZ6CPdMJ3IPSOFrDUIpdROZYtd8vxPl8FrWeNYBSu8NEgIvWOrJ4iN2eFF2hiV/zGLsiNwR2xQcU7IBj+9xRwd0=
X-Received: by 2002:a0d:e648:0:b0:55a:c6c:bef0 with SMTP id
 p69-20020a0de648000000b0055a0c6cbef0mr22469558ywe.23.1683854101272; Thu, 11
 May 2023 18:15:01 -0700 (PDT)
MIME-Version: 1.0
From: Sijie Lan <sijielan@gmail.com>
Date: Thu, 11 May 2023 21:10:36 -0400
Message-ID: <CAGAHmYC8AR_iw=nXQc6s29T3SkSoz9Ajd0N39Nv87orJJHMLGQ@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, guys, When I do some specific test scenarios, I want to
 do some direct write after data have been compressed in F2FS, but when I
 track the internal functions, it seems F2FS forces my direct-io request to
 bu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sijielan[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.178 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pxHND-003wtq-4T
Subject: [f2fs-dev] Is compression available under direct-io mode?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, guys,

When I do some specific test scenarios, I want to do some direct write
after data have been compressed in F2FS, but when I track the internal
functions, it seems F2FS forces my direct-io request to buffer-io
mode. Does it mean we can not do the write direct-io if we applied the
compression feature? In other words, must f2fs use an inside buffer to
provide compression functions?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
