Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1421AD93
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:33:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjnG-0005o6-5k; Fri, 10 Jul 2020 03:33:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jtjnE-0005nz-V6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMBV4Nk27FzGelkIUha4opGJdr+5fx37xiez/wnPzaw=; b=SaDrO87QpbgDMK9AiiRrfFrxLW
 VYyu0hEUGVYJnoUPROkygY704Xj43gJUqzvVBthziUKBa14kLthLJktHQJKT1wvlxGxeuE/ckp1rb
 wfL7J5VfasSnSlD+P5swRi9I6+jHzcK0oMhXSlve/1vAZDScpD74661gh5kPtFrK+LSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FMBV4Nk27FzGelkIUha4opGJdr+5fx37xiez/wnPzaw=; b=i
 CtQycF14GFy9BZLmdEM6PiJ9mQ+mkdoEe/WVLdJhgGd2v+Zii2sStbiSGqAv60mKOax+x2LSWiLQw
 64a8SJbSrzWHW4Z0EOrxf+L5QWZNAG/LDbIo/GwMsQCxym/TNY7nUn2eS9N3lKDzMd7t8D7DMBxW/
 iVpjsJ0hGRaQTrCA=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtjn0-00Fouw-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:33:44 +0000
Received: by mail-ej1-f51.google.com with SMTP id n26so4501014ejx.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 20:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=FMBV4Nk27FzGelkIUha4opGJdr+5fx37xiez/wnPzaw=;
 b=qo3G6tscTRRMHiJeuZo8iFsOi40nCYGYY3Nj+fe0vyhurR9hvuu8Gq2BRHug3IcCXZ
 MmnjqIBijAgmcMo4mL29grPbl71H62A75rMibxUQ1/WYQoLkDloclIU+5vHuQ0TcyFjc
 O0s23+jQ/ptDEFuCQlQfweUg3dHi69ovsLKO6+VnXPL+vwnTCVvHtdUZ0iPKqYWS01lZ
 214G6/pPYsQ6v/WAeFryEr0JX0AUuVhiDQHSb2SvmNgQiebYYIXxW/r+8C6CbATO8rJg
 S9rpnqERlYborPwAie1W01kFgtdqjNDaYNuPGfmP4+YDWgQe0qJ+/kWnPtS3A/1L6LeR
 W3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FMBV4Nk27FzGelkIUha4opGJdr+5fx37xiez/wnPzaw=;
 b=KQpGx0ydvAtbRmtrPzTXJYCovccB4qo9BAtGPGBcDRY4zobCEDBNwPsJ11HZbclEKh
 aJD0pG44x8Gr+4/gnFwWr2nnRxpGlJXOHBlJ4pR+oDDdTiwyxePSPc9RnwKjc5JAyBmq
 QRSrQOguywu/HJBbD2c1NK60l3aeggRzPvL8vc3t2UjlRVn2i8QlW9IZBmfDKvg/VZ0j
 pAEkpnyZnPl7fd3jQX4FNVLUxNVhf6c0d6mzKWAfwWy23BhLehEH0gTGf2NDRDqFumHP
 52y/KAzwa5TdW5AU0cLZzPVkhv77BK7diGwRe8fG9SJVYctQaTYwJGsNBYcagAClOXaN
 DLBg==
X-Gm-Message-State: AOAM533zooHyvw2zbo04vZcmlfaa3PYqVMl0URchtsl3C0+I4r6Ruxya
 IutDF4rggTvwZjcccqIEtJwmXdQSjhXy322L0WP3PJfY
X-Google-Smtp-Source: ABdhPJzgw0ddMepMd8MyScjBPAp7BMRqzi1dBo6SQxzFVq7W8kPylHuIe13V8QosXrPSTEjCYvmXZTPj75YvdNG9MZE=
X-Received: by 2002:a17:906:f88a:: with SMTP id
 lg10mr58147044ejb.317.1594351999467; 
 Thu, 09 Jul 2020 20:33:19 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Fri, 10 Jul 2020 11:33:07 +0800
Message-ID: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jtjn0-00Fouw-5q
Subject: [f2fs-dev] possible to allocate a full segment for a direct IO with
 blocksize 2MB?
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

I create 3 dd job write 1GB file with directIO and blocksize is 2MB
equal to segment size.

But it seems the each IO of three job's physical block address maybe
in different segment.

If I can get full segment for one directIO, I thought performance will be up.

Is that possible?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
