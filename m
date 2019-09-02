Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B810A5B18
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2019 18:05:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4opj-0000Xk-Ot; Mon, 02 Sep 2019 16:05:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <teo.en.ming.smartphone@gmail.com>)
 id 1i4opi-0000XZ-W3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 16:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NzNhTv97ocb1btJLZ5/87Ps57YM4E7GBGFrOG0ccvdg=; b=j17HAVRt39Sj99udD7ET0kDavF
 t7wt8l49Ngju2/wFpZdHAHdmPuErT6UzvwKjvUEo/DbFPwiJ+HhfpXvnv2tFIGc+iVwW02FSmoWuF
 nUjwQfsm+ddlVn+cZ8qXkluAdvVgQ5kcMqddE2aT6fEW4hD78sOtLUi3LdWneksVesrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NzNhTv97ocb1btJLZ5/87Ps57YM4E7GBGFrOG0ccvdg=; b=R
 +E3fHO5H+0IjNJYdFxbP0bOXeprZ/3pHHfqHwfwCxaFuphkxioGeeB/+SkqUZQcdIJXk92G3wek3J
 QKME/xYNqsyqReJaOCbhnEsddR9va2stDd3nDCSYIRfbdKgAzOUbmSu8pun8qM3xOqWdSuZcc9rB7
 6O7mDwgW5hbI5KVc=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i4oph-007Uzz-8k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 16:05:34 +0000
Received: by mail-lf1-f66.google.com with SMTP id w67so10754985lff.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Sep 2019 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=NzNhTv97ocb1btJLZ5/87Ps57YM4E7GBGFrOG0ccvdg=;
 b=uTVrH2GD0xIp961qbP4kd6PpxqIhZpSs9Jm5k419sRBvVGea/eQ0grxgJ2YwQdp/Zv
 GlpNqojrA58D6kJLxKNq6bp23Zem+CHmCjw0oQuP2yTKvQRFfuLkHDTi2hOCNcdJ6rY7
 e0PpB5EO+fUJ8fW5dIl648SF1qY8LWYtsbh1WHcfFPaelgoQBfQ43K5bvy53cAl4hGPW
 fipRuHCL6fQnsg9y+IIz69Ep8PVj+7hG9Dr1DVB0MmPU7XgHD0XAqhPT59PTtpKPjeq2
 7U9YzCQs8AdMq/wbr0c/0nNR8e2YcDmrIFIhY59KiNbAW9jGte36WksOAm7Jk18s+yMV
 cqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=NzNhTv97ocb1btJLZ5/87Ps57YM4E7GBGFrOG0ccvdg=;
 b=STZVOI+t+FrdkbMMH+FtgEN0kzYHEH1rXEywt06cHs21TOnorHSDGt+FZ/y5FxQJkv
 yHXvKw/W8j+fGBCu7RsF+JDlYucSQFZDZUMt+ewxT1tM6NRL+vfdh+12l975mILlpB0S
 Wt61ixaMaYICCbNZq/HsrB7eVk75Zw5/+QIX3swmSZFk9mWO2JkCoFnhFpZBiqarTGKh
 gGvprbe/WCeO7m/2ss94kGYR95/EzKoQztXyTXCsa63SbhR6EUXHO+ZJSAR1vJxkNbXz
 j1vOHMiBzw6zEAHkktxRdZS6ln9odILsj+2iMKJBCuqONbEQDm/8q0Ctrapg6Hrqx/6+
 s06Q==
X-Gm-Message-State: APjAAAWTdSnCIAdsA0P7+ZVG/Qu1PSPuGyjT7TXTH/AxtEXI5sie4Tot
 k4pujHzf0aXdbcWKkaFXydgZuIpnyIX8jU1YZ2+YkrvO
X-Google-Smtp-Source: APXvYqyqp0ZfRq/D9VUkuVrc1PRCnyITHsqiTDgqo7rwqn9NoxeyWpY/63lABSNBKhxHa1cyD35DmKumotw39gQAUSA=
X-Received: by 2002:ac2:5090:: with SMTP id f16mr3566260lfm.66.1567440326382; 
 Mon, 02 Sep 2019 09:05:26 -0700 (PDT)
MIME-Version: 1.0
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming.smartphone@gmail.com>
Date: Tue, 3 Sep 2019 00:05:12 +0800
Message-ID: <CA+5xKD4J+AGjvQqt3HhLWNm3c-QfqAJsB0hGPMrc=V=HjjUXNA@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (teo.en.ming.smartphone[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i4oph-007Uzz-8k
Subject: [f2fs-dev] Singapore Citizen Mr. Teo En Ming's Refugee Seeking
 Attempts, In The Search of a Substantially Better Life
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
Cc: Turritopsis Dohrnii Teo En Ming <teo.en.ming.smartphone@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Subject: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts,
In The Search of a Substantially Better Life

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogspot blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiwan-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-government-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee
Agency, Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees, Bangkok

Link: https://www.youtube.com/watch?v=utpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 31st August 2019: 593

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 31st August 2019: 2815
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA





-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
