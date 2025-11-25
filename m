Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D88C8778D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 00:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Date:To:From:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzsA5ZUabLZRD0vEUtVKuIIeYwC9EXCCNwfN811Cb+A=; b=Z0zJhec7Lv6R9nzMfa/1IbLGOO
	w+ZzlWcN93Qm87il5S2PSDZnx6KN3Hj3jHSgLJWrG4+K+uxNcXKVnGB2I2g/pvBqS7ihDvF52BZKm
	2xU2hb9o5N1+vuvpbaJlYYfYSzPfDYu1IwlN565fY0nDdLQb0dSjZVZy5Ex1hsPP0WFs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO2Xt-0000d3-Pt;
	Tue, 25 Nov 2025 23:34:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wilfred.opensource@gmail.com>) id 1vO2Xa-0000ax-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 23:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3rkC5tVLIYNbT+NJhSO0xtU9bfDYrwdByb9M2iU+wBw=; b=Y+kdyuiDO6uiNgv6CR5bWRrHRe
 ofijAfsqXLKqfxO9U9Oa62dcF6RHQzj2Gh+h+3u759fp3TAGPUIfg7LtrZUjlfJCbztyGivsw3VpE
 Z6beGKUzRQsE1cMenJEgKgSAe1Dt4zNkVa76xQRKPhLz1TL14Zl/gn+6UpJyRqKkYl4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3rkC5tVLIYNbT+NJhSO0xtU9bfDYrwdByb9M2iU+wBw=; b=Yv2NO8v6IvhSueHL0bhznJwZYT
 1cFXV3sVZNDKPnEp4BTJjlYD84372OeIjQUF0xLuprTeLVtaztuP+FKvZYblkVveYOhj0XQDVARpk
 VE8iYm6iXH5o7tf3xN9lU/DgdIDlB3pvT35Nr7k/uncuZwadSMcHDWuqRisILyIY4Bdo=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vO2Xa-0003gZ-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 23:33:47 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3434700be69so8638321a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 15:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764113616; x=1764718416; darn=lists.sourceforge.net;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3rkC5tVLIYNbT+NJhSO0xtU9bfDYrwdByb9M2iU+wBw=;
 b=BLQN7shcR3Hq5tYywABtJIhVYWc+E+VAqVT4T3OJUbcxf25yH0BLz0d4uyMA7JncIU
 sBLedhXSKBsn2oQJ8D46NSV3hCGZM4NKZNQkvpGW1+1gk2RQphRhQUdsZqiqQrOSkuXQ
 fO3s5EaUnnSy8plyfrwgqzMbeVpiR5hyr0FXRREhyKC/nvCJDJ+HA66cdSZczhvvO/sl
 x2HdekrC7TIY+QYOrwISeobu9lYgWaQReEBHd0J8xRVYUeCoeMEIQoBksr9iriGUWTnq
 2s+fNOsncjIiVcJIOzhpQCCKAa9eD/XUrGWoAKkAf6Mk4FAi2ipldGCb+wnfmuFoVJRL
 sKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764113616; x=1764718416;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3rkC5tVLIYNbT+NJhSO0xtU9bfDYrwdByb9M2iU+wBw=;
 b=OnjmDwwXqJeFLDFzJlWSKDyii9Doe5jMXqToeXUW3vJ7TMm2WRCEVM1qAdyz2lGUKM
 qoTX+CQ+Bq4OWgjIS8iR+Ez23VDaduDDHbX3MbRepGkcH7m5CQwxoTySf3fL7PFENB3k
 ddLz8onZ3h2iauWzoDSbwrCg0HlBvkOt+Co9OWzi5hndwf+YcqvhZ1FxoyMyA0dHciPE
 XaWPmu1A5fuFoCBiNrkrPY7au++38v+sLAU65uxLS7XGQqzn8TJEiwABLi7LyYHLHjtf
 mA/e0Q27iIfbub2qQKw8zEcDIElWWEz+LGD6tbRwrJj70qx6GhdlDqKg9p26DbzEy+rg
 nUsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6TOtl/yOUxr0SQEg68l7SRbARWQVSQtmL5hfhONqOF31Se6WMhWpBUQCHF3/cZiy0V4AoPT+vDlf+WtV3Wdrg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzW3sBRK6tNnSDum9XdVRSZGYASWlxR963cLfcoBYV6Je/kZ4NQ
 Y3IwW6KIKhVw9hvXeKnKl0C0N1MO+b53miR9s3HWPsqEYAzr6s1MpYzK
X-Gm-Gg: ASbGncvFkZONlfTDXStzuQ9flo7q+L4UW8x0R84ubzK/YYIey5vXOT7YB3hl4N+WFgM
 eJk+RIDBbjmlPgGPeOxUCAyuR6kWhrHVnOMMHov6oAtE8CExtSFz6yseq3iD01lCOM6ous/bZUt
 1ijC7BGpW9KT/uUp6GfIxdz2vImgFpDpFv10RoC6aMsM1NplNyNDfisnb6PIwfXSElQzE3yNDv4
 BxuSkWKHmHwjtUt+aK1Dm46abbq4Ef4eugfV5LTOc5QthzXqSYjinE3cPBVe44gNeZ8+8Di1rVz
 /q/IOfYNFYUUHBf0z2x1d1F7PrKwBXO36RiEOBdR2T5CvN+DBgRR7EEpVuei94sH6X9baZ4RuIk
 YRW5rV0kgFAKQDPS3vME2MAHxziSYR85EevCAFWtb1kkX+7gWqnUaMVUuXNHfIelbeW94dVHNrG
 uyc1CJu8rnRmoZq0VhhamD0KFuJsQ=
X-Google-Smtp-Source: AGHT+IGN2yQvKPDnQSI+rfi8GFgwmIi2Dp/WjRDvh8wa+7M3RBmYm0POoYwrQhejduq1ue9sQHFv6Q==
X-Received: by 2002:a17:90b:3a4e:b0:33f:ebc2:645 with SMTP id
 98e67ed59e1d1-3475ed448a0mr4374100a91.20.1764113616140; 
 Tue, 25 Nov 2025 15:33:36 -0800 (PST)
Received: from [192.168.0.233] ([159.196.5.243])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3475ff0eae4sm1654152a91.4.2025.11.25.15.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 15:33:35 -0800 (PST)
Message-ID: <2146e663be965ee0d7ef446c7c716d1c77a8a416.camel@gmail.com>
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, axboe@kernel.dk, 
 agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, song@kernel.org, 
 yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 jaegeuk@kernel.org, 	chao@kernel.org, cem@kernel.org
Date: Wed, 26 Nov 2025 09:33:26 +1000
In-Reply-To: <20251124025737.203571-2-ckulkarnilinux@gmail.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-2-ckulkarnilinux@gmail.com>
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Reviewed-by: Wilfred Mallawa Regards, Wilfred 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [wilfred.opensource(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vO2Xa-0003gZ-P1
Subject: Re: [f2fs-dev] [PATCH V2 1/5] block: ignore discard return value
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

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Regards,
Wilfred


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
