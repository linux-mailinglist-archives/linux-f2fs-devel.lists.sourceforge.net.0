Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F9362E35
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Apr 2021 09:03:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lXez0-0005Pc-1D; Sat, 17 Apr 2021 07:03:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <fengnanchang@gmail.com>) id 1lXeyw-0005PT-Tf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Apr 2021 07:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ei/4Ehq6sC9+wKOAkqqlLCuUz+fcyp7UR7dxbDAo3hg=; b=e2BHTFk8iDCI1G/pft7+lhMBiY
 xABJBCnYS+anpwYExc9IctvNtWiITLsJ/qKOginUXLo4fgDQLvMfuGB4uDthUVYYIi2DAijuok6cP
 5FiT3HK+yr7hjHFLCrMScCg5/JmI11ySdB+sG5kcCNwy1UwdIDD7KjpmCSUyb1KSXI8c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ei/4Ehq6sC9+wKOAkqqlLCuUz+fcyp7UR7dxbDAo3hg=; b=UoPpww30TYgWPzUgazNyS0Ej0M
 pprAcORSoswCjxi3mp0sXTk8YFNaCYV3Vo20JuJntKcIXX0LLvmALnQe0MhYoOc6rfRWIyLBmHnIq
 YWOFtzrbVEBZP9d9GnIMkPVlNQKFg7Q9l43tRuc355KMSqocUwIgsROWx8IKSW/ObZ58=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lXeys-0005mu-5X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Apr 2021 07:03:06 +0000
Received: by mail-pg1-f170.google.com with SMTP id z16so20649748pga.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 17 Apr 2021 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ei/4Ehq6sC9+wKOAkqqlLCuUz+fcyp7UR7dxbDAo3hg=;
 b=Ytf1oICLV36nsO0vqvEAQRrUqbESzfPhNvI+ZuX4+6YSkgiKVel6zi+6Tciq6fYugL
 9HI5eEJxlE3RRWfdR0T2L+TnbwQpUIL8H54xp5LWSxEzkdQyEy7Z4nnq5QiksaCT6TRA
 6GGBlpXKAaA6JMmfFp6ftydpfJuFne5o4XCLf2oSOGd+cXWTCZQlnPOsxrwlvBiYzePn
 srgKcYc9h3AYyIy79unBON7OTe097/MTeJpqtR3tttFc7yW3YdPs+bQj6/yN13wH+1vJ
 XFuCNkQKU1t77Bmfql3TEPuhFQnA5UyrBkC72GE2wX+XQJ8FkyDjvKMpUX7cHuHJqqJM
 4eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ei/4Ehq6sC9+wKOAkqqlLCuUz+fcyp7UR7dxbDAo3hg=;
 b=VPe+MbptdYzVQaOJ/FqCiwZsy9qaHmdtXHUkR3LNKNDeKjAv7NeS165Ty/zsqMAYvi
 S3M9Bmb5Nhd6onW0kA73WbYcXbqgFskRNahMfDzpEJgb6wRO3PaB7Jq2enHBnsO4LXqd
 F5GgNJkhfwgMcrQiTaWkGAmaAP5nAdYvCbEDVAhgtnjpjzGA3PgiE3eVxNTiA8yD8+KR
 ++1aLmE6MpBpqyuRtY4wH8b5IEhe/ZfUbHWiJ0aZWFux6OeBWGSo5TZzoIxKvIG6hr9A
 OBoLXdMDlAwlXqTQEEV52YdGpeKUwch39eL6rtt8Aw0FZ2A9lXvwrot45ofg9doaNHkb
 BAGg==
X-Gm-Message-State: AOAM531P9EUMvgIDrcpE7wC9qmW8tAbVma0PM+3oWL/WOWSeTRvHRWhY
 C2QyvfcoQr4v4JAoHOPMX6oCv4Bn/00=
X-Google-Smtp-Source: ABdhPJy2G1763OIASIg/K8CXvT2EUyADKzK+TdTdcPN9cXf1F/sOBwVPyDsb7vweR5z7Elh6hfww9A==
X-Received: by 2002:aa7:8389:0:b029:209:da1c:17b5 with SMTP id
 u9-20020aa783890000b0290209da1c17b5mr11103329pfm.29.1618642976742; 
 Sat, 17 Apr 2021 00:02:56 -0700 (PDT)
Received: from localhost.localdomain ([103.138.53.220])
 by smtp.googlemail.com with ESMTPSA id e9sm6690233pgk.69.2021.04.17.00.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 00:02:55 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: yuchao0@huawei.com
Date: Sat, 17 Apr 2021 15:02:51 +0800
Message-Id: <20210417070251.42979-1-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4dc282e0-b41c-caf2-c2ff-a6372e60a906@huawei.com>
References: <4dc282e0-b41c-caf2-c2ff-a6372e60a906@huawei.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fengnanchang[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.170 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lXeys-0005mu-5X
Subject: [f2fs-dev]
 =?y?q?Re=3A=20=5Bf2fs-dev=5D=20=E7=AD=94=E5=A4=8D=3A=20=20=5BRFC=20PATCH=5D=20f2fs=3A=20add=20no=20compress=20extensions=20support?=
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
Cc: jaegeuk@kernel.org, changfengnan@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============0030318180835187861=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============0030318180835187861==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

In this patch, we cannot handle files without extensions. At the moment there is just a rough idea，test a portion of the data to decide whether to compress it before performing a full compression. It may need more test.  Any other suggestions?

In my consider, the non-compress  flag has a higher priority than the compressed flag.
1. the same extension name cannot not appear in both compress and non-compress extension at the same time， check this in mount process.
2. If the compress extension specifies all files, the types specified by the non-compress extension will be treated as special cases and will not be compressed.
3. If the non-compress extension specifies all files, should not specifies any compress extension, check in mount process too.

Any other suggestions?
Thanks.



--===============0030318180835187861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0030318180835187861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============0030318180835187861==--
