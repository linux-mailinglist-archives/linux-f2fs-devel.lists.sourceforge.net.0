Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D15C86C48
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 20:20:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Date:Message-Id:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebyFkcz+ooR1RlK4RwUUHqpksmLRY8XtYwtV/rUQ+5U=; b=ULUE5bqNBnWVu6jLpLhXn0fMsM
	JMkFG0mWHuRH1EJdSnpps+y9hr87NwViyt4x+u0D0YSDZaML9oz/3cXnaVGLdP1UJjptGj6c4/fnz
	977nueNjvH3zg6Q175ShmlTpEXYaF5gf1cRIt+IKyeOtk5GGy5+lfREWRwDybEc5Sgek=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNyaE-0007o1-9W;
	Tue, 25 Nov 2025 19:20:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1vNyaC-0007nu-MM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wynpj+E5fG2Oh1abG+WZEscR5HBvHm5298AKLCuUClg=; b=EjyvgcU/s2H91P6B+vXkuxLqQU
 I2VM/xi5vxyD9marbLQ5Xigvu1zNXqJd3hy0ha3/oje+TQGDso6+hw93hl/pehHzHIHI0q3AaBeXs
 NImnOUOqgaGhq0X2HGx+zYDLd8T6WmdybY+xLln85chb/XFaCapGOPAxU9aeuVw+C33k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wynpj+E5fG2Oh1abG+WZEscR5HBvHm5298AKLCuUClg=; b=GwmQB2L4h4e5QDoY3nGqLZKpWu
 /iFQL68QTSBvC4wr89LIJZLqReFjRbzHi/2/RjKxDpp4N8WAMpOWGyKfwXoI8TrBTQxgbwsCxF1iG
 TCAQJgGmC+AKSIMjuAvNRqL1jb/iVmCrM358BzrFw8oko+BjsmdpJljlFyXzVmtxU/uM=;
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNyaC-0003X5-9y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 19:20:12 +0000
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-948f8fa9451so172127939f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764098406; x=1764703206;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wynpj+E5fG2Oh1abG+WZEscR5HBvHm5298AKLCuUClg=;
 b=K+LU7dahlW4iMPq/V/qXixrNJbl9CwUDfXdr2l02Xu2P44YtXDz5UP04mBrzfyFab6
 ra6FpFNwHKm8+N7OoNPt/G33+NA79Q2uedu60JlLTsKqtsMNaHz9T/43LwKL3rozxV27
 KqhvPff9VuBkXenx2rvOUJH7+PKW4FNkhNmb0zEd8YJ2+h37SUocgv7ww/PrzoKGwchU
 iUgZFupGd4CDWX51SMYeM8sr59Qu5Ncbhn4YOHYbWo+xvcyi4UtV/oyAI+ZJZ69Dns3j
 BJXXt//oezjZOXQfAeD5raTiGbBxG8csUvN44SPew8fufGFBtZP96oStA0Z+MCW2uJzN
 E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764098406; x=1764703206;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wynpj+E5fG2Oh1abG+WZEscR5HBvHm5298AKLCuUClg=;
 b=W7EOfXrgT29qWKCvk2fiTAXUab45oPYd/DahISKWbTamkcVOKofgV1sWxzoduKhdaH
 mdy1gLDk1Tpx233fNMy8iOUPwDLU6ZDByma4VwUw+dUzofLZIGtvgvWA8PBWeGDe8RJ+
 7sGZJ7jM8MgiPZVoMesKennTYacH0p2tziENYqsUaeAE1SiB6dMPEgi/eRkUL2VRJfqg
 Kys5a//Oi2cfwidmtZZOKzvBSHiJGeFxkQVwv69SYIssJWhB1NdQxfbqbXvbeW7nCKZU
 FntDUghQOXw4onjtUZP+/cX8G2CCXUTbIrw8SMI8VAmLxpy69u4wsnzMnro+0GdgHOCi
 tdsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/uAvgrMs38EGqq9YIJgjuTzV/iX1Grlh1gFVGcBpAPEIyO0wdlBKPRoT9aKNsRecnj2byOgSWulZq8SYeKn/9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzA4+qOwbASrOKLKIOCb/PTExU8va1UAiIl6nxvQOR8shja+yO+
 yS+m8fPW9OY43exeCLmVJ1qjitoXCSVPGJSc7JukIL3bF2XpRKGwpBLEzrJsolqaaU0=
X-Gm-Gg: ASbGncugkCRPQTRpsonc57o5yJTeaW5QvBYl6IYbTXFgp6pQPr0Cxf0FRLgZKWye76c
 o22p0z4QluvawDpDIz/IGoqc6g1+YV83KPnmRIYrCGOVHqY+eqqwZT/Vb0pD8AQLDDwKoS6thOq
 RGYdQ29WpoU94qj/KB/vVgfUTUaH4J1YApNgbbjFKAxLAuSIXwu4Tp79aZfaYvwyBzKnp+2/t+N
 7pQ+H+Sl8P7IplKT84sGCipHuxHGDoaoFOhD+RVuUBn2VxU4wEcTKf7vthsDbtu+qCJ7F01GVU7
 xvlSmnJVDz54kLjhWoxBbql4NXmbLYlGTMYh/N8+y6J+SlX6bePui5HL5NYeOwbVmoanUmoUsv3
 SLaRjQ5/FKdog80wB4F+EKH6RKwLMmwBcU+bTW0V3ZejcAfArvRnYh8+tIw8SlydXVsU15sS4Gz
 nJdw==
X-Google-Smtp-Source: AGHT+IEoSNUPWsr6TkiMj1VyTgtSM+H2mYKN8PQqct0sy21hTM0OQb7u5ZARk6n0QLi/CE7kBBB/xg==
X-Received: by 2002:a05:6602:690d:b0:948:a32b:b6c4 with SMTP id
 ca18e2360f4ac-949473eb047mr1023076839f.3.1764098406436; 
 Tue, 25 Nov 2025 11:20:06 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-949385c2405sm668551239f.6.2025.11.25.11.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 11:20:05 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, 
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org, 
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
Message-Id: <176409840493.40095.8097031483064544929.b4-ty@kernel.dk>
Date: Tue, 25 Nov 2025 12:20:04 -0700
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 24 Nov 2025 15:48:00 -0800, Chaitanya Kulkarni wrote:
 > __blkdev_issue_discard() only returns value 0, that makes post call > error
 checking code dead. This patch series revmoes this dead cod [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.42 listed in wl.mailspike.net]
X-Headers-End: 1vNyaC-0003X5-9y
Subject: Re: [f2fs-dev] (subset) [PATCH V3 0/6] block: ignore
 __blkdev_issue_discard() ret value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On Mon, 24 Nov 2025 15:48:00 -0800, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() only returns value 0, that makes post call
> error checking code dead. This patch series revmoes this dead code at
> all the call sites and adjust the callers.
> 
> Please note that it doesn't change the return type of the function from
> int to void in this series, it will be done once this series gets merged
> smoothly.
> 
> [...]

Applied, thanks!

[1/6] block: ignore discard return value
      (no commit info)

Best regards,
-- 
Jens Axboe





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
