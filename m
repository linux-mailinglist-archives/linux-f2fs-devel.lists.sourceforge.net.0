Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A6BCFF7F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Oct 2025 07:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12dWD5JBCIvwf/VX96Je87OAX/rfZ7Im1doKOAu3mAQ=; b=VK3C03a7+e66JKFcKAPKO+hRXu
	aLl4hBld+BtmCmEkzbIymjxIKB5iV0kPOHnuDlV7L0ddCXZD5Td9Ud/qv+Ib0/ZLH9steo7zcRcIW
	DhKPXMsAEonFIUzUzvdUSZj9tu9A8izNhiVm4zACR+51zS5kVu+UY+qWRt+/HVCz9dRg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7ogR-0004hv-8c;
	Sun, 12 Oct 2025 05:31:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogunix@gmail.com>) id 1v7ogP-0004hh-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 05:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=; b=d2bA7Bkd+AOXAHvAkxB3n1k29F
 brgrQojLGOVlHl8V7SutQutyF0H7mnnsGg7CwSqN5CAIaCTOdmCoS1guY45vq0FwuVWn2eY3u3OaU
 Ww1QMfc9TixKf9Ku83ePO0fGqORVczPN6sU0DhdTctk7dzfG8fx3X62JaUr/X47Tg4A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=; b=RDWLTug0P3yMjtlgKijQxkk2s/
 vosYe3qYrPyghzzW42GBDdx9Wc/etXobqiGrqn572ZOwx2X2ubrZ3bWPJ/Q78OZwjrj2skr5eBzQ9
 KSYZ6Yx5DLaRgslT6mUj41pPVqYrGs6Rt8j3c0nXVQrUK/STO1HuMxxX05O6VD4HKNDI=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v7ogP-0002kf-Ho for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 05:31:49 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-32ecc60c9e6so584470a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Oct 2025 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760247099; x=1760851899; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=;
 b=bX66siEifjoJ2Vbc7CnSwOdKpwN2TN4x3whHS0MCS15vRDHepI9V82FO1f+vtFG3Bd
 sg2giSb/kX6m3dGIYVoYsB2/3eYWXXA/Kd2RG01Hb3+0nsfs3UC0xlIsng5/dQe9cnvk
 LvUTto+5YAPkvVYnoCu8HHs6+o4SCDtiixc8SaDR2Dmx6TjJck5SwQ5+iFuxw4LWfRN6
 i4p4lGUhQ2+6KxGsFX50Y8kXwJab8kmWFCaBeVNMqyFq6kNlmOTKxHaBKy+buA6cdaIv
 obfcefqpCpLCYcOk/1f6CjhWwh9/fZK3OM8PSs1l7/FhFUI5oW8hbrE/NhO8jT4JshTK
 R7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760247099; x=1760851899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V315Oz2UwZma7KgfzSEN+KehYy049Dd9a5YOBN+/BjE=;
 b=Ypi9vnxDR3iVZrj6dFURJQLrmA8dyJ5b3NVC17aaDOq2BDExyNqkpB/lAaSURCWce/
 fRCmF86S5ym7Z2RPIfRpDbFMGT/weAOocVEbvCuHPDq+C/Z/bhNNepBTDmR1fgCFcu/D
 rG8/9+WLI5durxb5XQQjlQWvDGSbwdENeIaob4EW4MHtWFptK0oX8/yo3MeYX4W02H1y
 TS2X6kikiS2u5EXTXHC3KCtvbW6kHtx68ckpcycPbCqb46KfIWT0rAdkXUZUaiZGjX0B
 Ey6l8cC+Q33o2NkJVKvyRNNa9pF1PqbMrSnc32l0ElotKcYAQ0WyEZjrqJTvf3g3ez5s
 isEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWULSve3JwCF4Sg7/sUV/NyvrQpyO12PwPhsrsTOPeNCBhi3wqd3CB9QZ/U6+VfU6phPflIGtIi2IUpeSneB34a@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5vEfvESpydWeLN/DjaDJtECX2ywR3wQHutF00iC0tbCgqab5/
 5gobOWtnDrQNtNluvlz9b7W2s5jbL2IX4newsDPLk3EY1qMfq44kI300
X-Gm-Gg: ASbGncvM2LCiEkYeIn3NBqF7v8nvhC4ar4IY7hJp7Ps6DrW8Roygs2LOn84gLPsOAzz
 4/2UxqKDBrA0gcjYj/dphg/3IyPyDvcCUAORG/rNCawCfbrD+j08fXlA5GLVWuwm3QJpb4Sd/kK
 5085c1ABdRv623dS97w99MAe7n0CQvKi6/gU31/i257QV0tvkAKvsJMq+5BOzx2t4GQQn4k9swN
 BqkhtgENjWgGU1AE7S/nxzHYVaOAuGwLSiSGmsbyDy76B0GE9x5XYRymhaKKfvKxvL0WJ8/TmWR
 ReSJUqv33dPwmTkON4kEpzr+gJSrmYJQZbES5R5lJGdvywScXf8yuOQaNGCfIoknsBdHcV4kPmp
 SCDfuh7ZECzuHZOsljC3acMyXJzWiUuu4wiqDcmc0NiWDi4lR7Zo=
X-Google-Smtp-Source: AGHT+IGdgMMmNCve6hIXzVGxikslohoV+pMEGgcopaw46XiTYHSuaq6+3cVVsGeG9CQvShDrq4immg==
X-Received: by 2002:a17:90b:1b42:b0:32e:64ca:e849 with SMTP id
 98e67ed59e1d1-33b513990d5mr12118698a91.8.1760247098812; 
 Sat, 11 Oct 2025 22:31:38 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:ff1c:3f53:c7ab:f611])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b12756sm8028789a91.25.2025.10.11.22.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 22:31:38 -0700 (PDT)
Date: Sun, 12 Oct 2025 14:31:34 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <aOs9NiaXVrcO83dz@elitemini>
References: <20251011172415.114599-1-nogunix@gmail.com>
 <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, Thank you for your detailed feedback regarding the
 f2fs.rst issue. I have tested the current mainline (without my patch) using
 Sphinx 8.3.0+ (commit ab8303f4bb13) and Docutils 0.21.2 on Python 3.13.7.
 Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nogunix(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v7ogP-0002kf-Ho
Subject: Re: [f2fs-dev] [PATCH] Documentation: f2fs: wrap tables in literal
 code blocks to fix LaTeX build
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

Thank you for your detailed feedback regarding the f2fs.rst issue.

I have tested the current mainline (without my patch) using
Sphinx 8.3.0+ (commit ab8303f4bb13) and Docutils 0.21.2
on Python 3.13.7.

The pdfdocs build now completes successfully, and the nested
tables in f2fs.rst no longer cause any LaTeX errors.

It seems that the problem has been resolved in the upcoming
Sphinx 8.3 release, as you mentioned.

Thanks again for your kind guidance.

Best regards,  
Masaharu Noguchi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
