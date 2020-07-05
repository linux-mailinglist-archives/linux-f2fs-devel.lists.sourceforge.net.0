Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B7215066
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 01:47:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsEMB-0003KV-UN; Sun, 05 Jul 2020 23:47:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jsEMA-0003KN-GO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 23:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nPQESZvLzBCiWC6EG5DKB+ET67N7b5/1MLY//mTPGek=; b=KpbC+R8XBRsQqUioFCSXsrVEcZ
 dn9IPeNY2CuoozNFISLPvZJLa2lBQuJ96leqGM8YGOg3MVdi9k1dok0cBdkaeLXF/2h7BFyOO5L4y
 ZvaU9YdBt5S+JN4t2VXY3CJJlGdaw9bh4AjnpX5TovQVg15fpGCBagSijZ1lQ3zJCNwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nPQESZvLzBCiWC6EG5DKB+ET67N7b5/1MLY//mTPGek=; b=BjzmbAX3eA2rL8AzJWiXRXzS79
 YgciT3pBPkkUMYBdjGTWtHmDV9XNZxgxUw1948L57HVi6dCI8WZcqxCNy0zU3VCVTdw7oOEPSkeds
 VsUAQDEKnnpC7DzExUCiEIe3O7mVPqPeS0zougcni6hYc1Jy+oDCuDWBjLbfFGpOnx40=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsEM8-00EMgP-KD
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 23:47:34 +0000
Received: by mail-lf1-f65.google.com with SMTP id k17so8812086lfg.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 05 Jul 2020 16:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nPQESZvLzBCiWC6EG5DKB+ET67N7b5/1MLY//mTPGek=;
 b=WNPph1Rnfmu9y42wUJuMYOQV7Xxxcg/Ad/Vu9/PaQV2YOJMQVNnHf0Fs88lAv3CnFL
 9xR+pATJo3x4tN55YQG/TXCBad3pmyGqmA5fPyMXpF+qlIb3XLN3p5G0wVIv7tbvr1Wu
 5LKC9INYTOeYYMgE0O1rzTcifWTtOb9YDy9J4KjiAtkFhgFxNCnntWdneCq0V7PFMz0H
 lkd0TdbUniexNcGPTGfLovLYCeYAjT6NCwsPjmeDgOHAR7YTu0EKLqllwIaaDjs6EO/4
 ynDAM1q/wv7+wIfZNT6VIbEjQdVwjvTTfbqnvs8V9HBvv4a8HXZ5SV/jUJI+YVlJ7xK2
 bU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nPQESZvLzBCiWC6EG5DKB+ET67N7b5/1MLY//mTPGek=;
 b=V+dF/CCP3pA16HUwKdBzQPR0k4vXw+pjz0p66QsUr1qcCKxbvndARfXCxYdDDlXPDS
 No8Y3GGLDKi2GY6xlXe/HFW+zuzEnx0dx1txqPS4q1sqq9bxAN+nczyHLo8wrq82lUYn
 HckAnyuOp8BCOYV/8uM2QiZnnK2s7mR3eE5gNnnEMPVUAcpyJdI2XoW+8qKNeyV/wfi0
 379FlzjMDx7FeJmHOI5VlHBLoP1J0UeQc5Qw70R4QC78fJsUhYvX3IaButB+6V5Pgq5b
 nHuWg5KkFsqdHRnw5ZdU62Nf6z871bIQ7FemONwLrmoeBE3E7ie1LFMi8/J3Rx0RQ7/O
 Msig==
X-Gm-Message-State: AOAM532C8CI4xF9kp0wNxdnpRJhSwveE3H79agbo89YtlrU+Oo2fSFE8
 hfN6I7NCFQTUUSvIaJeYEILu9st9C4nW/lqLqu4=
X-Google-Smtp-Source: ABdhPJzSw1PL3kqgRpbbKJVwUy9vBzKOUowhbkDVg/jU/+Mzwe3KjxXCyBTInrASBs/BoC7LUWZ1diVxdKI2qtUtk4U=
X-Received: by 2002:ac2:5443:: with SMTP id d3mr28104550lfn.121.1593992838852; 
 Sun, 05 Jul 2020 16:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200703065420.3544269-1-daeho43@gmail.com>
 <20200703141359.GA2953162@kroah.com>
In-Reply-To: <20200703141359.GA2953162@kroah.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 6 Jul 2020 08:47:07 +0900
Message-ID: <CACOAw_yweR--34vBXBV07xEGxGhO2r9o_XYVw6h9dMP=C6zp5Q@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsEM8-00EMgP-KD
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add symbolic link to kobject in
 sysfs
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> No Documentation/ABI/ entry for your new sysfs file/link?

This is for adding a symbolic link to a pre-existed
/sys/fs/f2fs/<disk> directory and it means /sys/fs/f2fs/<mount> points
to /sys/fs/f2fs/<disk>. I already added the description of this in
Documentation/filesystems/f2fs.rst.

>
> And what does this help with?

Some system daemons in Android access with the pre-defined sysfs entry
name in the json file. So whenever the project changes and the
partition layout is changed, we have to follow up the changes and
modify /sys/fs/f2fs/<disk> name in the json file accordingly.

This will help them access all the f2fs sysfs entries consistently
without requiring to know those changes.

>
> If it's really needed, why don't we do this for all filesystem types?

This is for the daemon to change the mode of only F2FS with the power
hint of Android.

>
> thanks,
>
> greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
