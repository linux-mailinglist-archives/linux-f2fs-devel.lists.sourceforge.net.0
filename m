Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04029215605
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 13:01:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsOsa-00087J-8L; Mon, 06 Jul 2020 11:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jsOsV-000872-Cl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 11:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3NTkscpZe2xhi1TRuDqj+zeJ/GvGjMGS2yIfaXriwSI=; b=N7yjjV+zb3qXHsdoArMJh35Ny+
 I0E+tATrRO+lEWo6iQSSzq4nXWTucwEamgedr65CS9HUQjk0tRkz9SUTSVKoWDf0dPF/KK8MJV9Ug
 V5cZkVQlvY21FLBzewhkd6F2ZVXjLftw701YD2dcXpFhOkA1N+KOE+0vYOJTaQxtZDDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3NTkscpZe2xhi1TRuDqj+zeJ/GvGjMGS2yIfaXriwSI=; b=U
 WdEVJv/mWaDkfPcrhtbhoySSJyPBQ0ZaSvkKpSUNNifIw5NU1ehe3Swj6INcVrHgkbZk/MHGkOkeh
 TdBbbMC3y22fs2FpYm6M5yQ7MMWV1e0mpndOSrH6xnjNlAyHOeA2vGrcNTuLTDrPqYgB5FcArZDlq
 DaXgAJWFfiATeuek=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsOsI-00CCns-5T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 11:01:36 +0000
Received: by mail-ed1-f47.google.com with SMTP id by13so24511207edb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jul 2020 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=3NTkscpZe2xhi1TRuDqj+zeJ/GvGjMGS2yIfaXriwSI=;
 b=ce6iwWq6FDDsvmelgsuckiRbL8vu0ybWuQG9yYa/Ewl7lM06fqxEgRKoowuR96EtVw
 /im5ViIL+Jd9/pwe/X9BNR8c7GwkU1P0c3k0yTgJI9Y/BJPBkN7mlk9KrVazl9GIWEGY
 L/HakPT5q89OJN5cUMP5+1gQezrHnK01XEHyjMd3GEswC1QAlVUfd2C0D6naMUgs4u8b
 tHMwC9j9hFcrTxDbFP0BrQUoDjuew6HnAIY5hrq8c2MEWDRDiZBvbVBHZ7zzjEVbdqhV
 9lyI4jzPGklOZhzPzfwhHdelru+B5yMEVJXZvWW9/Kax/iJupBnKDmakmp7l//2bABTM
 kb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3NTkscpZe2xhi1TRuDqj+zeJ/GvGjMGS2yIfaXriwSI=;
 b=Ti5vG622MJy8Tjat0/PlP/IeZPmImbRCa4p9sMQYQ359UH0EOFOtSlcUSbp4LnKa3x
 if1BTDwmr10MfMUxbiowvdPCN3+aXH4Y95DokcsytXWXH5R0RrHWQCv/4ORD2vglmBGD
 XwAMBjUi8vDv6ygqRLzh3VemqA1V7KuR3gFx0af47aL2d7hh5pdFA5y1IGbVkwCSw//f
 b2EZfwgcZc000G9Uhe+jU5kE3cYupYZIb1BpVeBfXKayrjC05wefxNrf+oGeFOE0nGk7
 urr5VHkFaxuBGQGuNxybs5nOUet2oWPcTHOH8JzaJvqIHbXOnY0htiSQRpwFgf/xhMz7
 DfOQ==
X-Gm-Message-State: AOAM531sDOtl6yeOKSANKQfEBniPoYNGPYTQfCuHUXASHAQ/+ykPoRcV
 XwhpDmCyqvUTu8c9/CPjpUCP0OPfocv8ARBTtsURU/ro
X-Google-Smtp-Source: ABdhPJwiyRfqIpjiNnMAu+/HCkNAkDfsO/pFqBEoCKWdMu9fgf2+reiCdQPuae4W8yHrSkF2KAIgLgxfYcp+uOSOPQI=
X-Received: by 2002:a50:ec93:: with SMTP id e19mr28072561edr.254.1594033279511; 
 Mon, 06 Jul 2020 04:01:19 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Mon, 6 Jul 2020 19:01:11 +0800
Message-ID: <CAB3eZfvr=SXA1abObaCpcz7ONXyoCHXDSEvSCTSJ6SGnazm8dw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.47 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsOsI-00CCns-5T
Subject: [f2fs-dev] If submit 2MB directIO, full or append?
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

If I submit one 2MB directIO to f2fs, will f2fs find a segment which
can fit the 2MB data, or will append it to the existing non-full
segment?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
