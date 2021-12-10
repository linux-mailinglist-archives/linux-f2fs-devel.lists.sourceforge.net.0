Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868C46FAA7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 07:33:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvZSq-0007c2-UB; Fri, 10 Dec 2021 06:33:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <fengnanchang@gmail.com>) id 1mvZSp-0007bv-Ec
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 06:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E7Db6cZOx7+zF2P1oxzlfET6kWoFM1x3rhmeA+RzWaE=; b=B3QYUXmsb1tywmVX7MlflX1xrm
 y6XHX2SDdaYKrlyVuidpWbeVlbTTxkMsMKYnTEt7j2DeRIuQqjrseYMqSXja6ZyNiJ+8vO4DJDYtg
 TGq3MB/7iRCu9oh+9IfFCQqhpx0T02IPFk3lTIGU28cXqeDwYSVgg8Nq0FOn5QaimkRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E7Db6cZOx7+zF2P1oxzlfET6kWoFM1x3rhmeA+RzWaE=; b=TicNaivc2dxD7DWzyb3U/hPZ6y
 Xwg5fPjmxXemC4iD37dRRdUcxJ6H7M9zbMu3bIaztfHl9OBs1nC13/e2DsAHWs6j1FmbZmqKCtP47
 xufRTqGryff2IwZ+LEY0PFzd87kXWMtJatVXCW4xmciH6LPUXdBCCmwvYj3nuLsUk9jE=;
Received: from mail-vk1-f171.google.com ([209.85.221.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mvZSo-00AoJj-VW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 06:33:03 +0000
Received: by mail-vk1-f171.google.com with SMTP id 188so5359488vku.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Dec 2021 22:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7Db6cZOx7+zF2P1oxzlfET6kWoFM1x3rhmeA+RzWaE=;
 b=hetUdH+2SYPBibTTIV5LIFazy7ow2hxl0guatHon9Rt8xNhZRjRcvr9QoVpxR6m/SG
 jMX9siIC/tluEZXJKiGfHhU56ObCJJsfUeSJfCUl41b7+Go+pAu+0m6CeuL3qz4MhHnB
 ptuMHQ4yZ00olCE4ZgFyRTJnFG9ivxcyPQu8Bs5knYcLUPncUTQuA9fAt7U7fT4c2VRg
 ansbo07ByfY71yiEwJyN3O/GDZ8FrxbReqqmOCPtGaf1AES4ZK4/dUaNVDI8qjl0LGCi
 rFbzYuX/Cy3olMOHFXaemv3SSFxNzMx6K19NEvKzdNkwg+wTGIk3iiFJtz+dg/qbIJsH
 4XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7Db6cZOx7+zF2P1oxzlfET6kWoFM1x3rhmeA+RzWaE=;
 b=vZ0faEi9Of7agO9+4soNFWqQtd6kw6tkC23nys7Ku3EaNOTCJOQ/GQ24ptwJKtEuw+
 1lISY9NQA6bxN0boN5RmG20abk6XbERnK20ebHBeNUd9jVBY1VxVF2kAee2iu8rHHoUB
 5wT4ZdCCh3f4zWqAgLW6VW+zGXilRuSH9kwEsPt6ilzEk0t1ugIMW7ZZptAMeZ8LoCUU
 ueYz29XcQHjsGGHnFPkVU3SH4pG5feSBiVwETSKjMkUN8Hi7AlucE1SKSPmtdOMFMmE6
 9+Ic/uNO8ZLI9fXEECvlQItq11oYs2JZqa2ZKuVCzsPInEpbTUrvy96Fdkwk6V8FWbA/
 Tmhg==
X-Gm-Message-State: AOAM533Lx8guRMgzpkZ/IjVhifAeqq0Bm+dRtUFgruor2ny6SSmmS5LN
 5iUSj9U3/3tWP+YNkPHX4pS1HsD2yCvDkoOz21U=
X-Google-Smtp-Source: ABdhPJxApUf+VMltsFLv5WKSplt3FgcUSBsWlZsIDFE5m3SS1bDrjU/VKkKJnobnde7uO+uaitdyqtCx8wbtTy+fhIU=
X-Received: by 2002:a05:6122:732:: with SMTP id
 50mr16654120vki.28.1639117977233; 
 Thu, 09 Dec 2021 22:32:57 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211210043017epcas1p38cc53389a50e33752e97618498b18f33@epcas1p3.samsung.com>
 <20211210043012.180588-1-hj514.kim@samsung.com>
In-Reply-To: <20211210043012.180588-1-hj514.kim@samsung.com>
From: fengnan chang <fengnanchang@gmail.com>
Date: Fri, 10 Dec 2021 14:32:45 +0800
Message-ID: <CALWNXx9CXeVLpj--YoMJpZbYdyvBgzz8HCn1jLOXvLF1di-4jQ@mail.gmail.com>
To: Hyeong-Jun Kim <hj514.kim@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Great work，it fix my problem. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.171 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.171 listed in wl.mailspike.net]
X-Headers-End: 1mvZSo-00AoJj-VW
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix potential deadlock of
 compress file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R3JlYXQgd29ya++8jGl0IGZpeCBteSBwcm9ibGVtLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
