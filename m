Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26695C7B1F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 18:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HCxtD6jzHEk4nM07jLR5viALrcXuqMi+s5oIJQh3/4=; b=KIXI9CMT6yeWqT5C1wO7zynYRK
	5Psji0yax0gMJsZ9Dt5zwkORXp3s0Q0dofwteaQ8fg4kmtLTq8Ewj4pRSfTorrCwybOrpjj/0pUUD
	3g8AZ9zV7oxS/qGvjpLcf4ZJlFyN4jAqe5IZoqdmrP9Tsb+EnnEPhdBZt6MKYJrXI+nw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMVFI-0002Ah-AS;
	Fri, 21 Nov 2025 17:48:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1vMVFF-0002AZ-Ux
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 17:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNzKWpQv7lDfglFx9RxULrTltnsu8Y95y71vG4fAv+0=; b=ZjnYbzpyPpSeeFGbq84PIw20uU
 adFkOluDFtl8RBHI0nv0xqSujrS6ifiNOOpU0tisWNWDgSAg/xneb4EFZG59D71gMdxYZRIZ1l0qM
 wjogh337ccHwDgw797sWOeEjoeFEwAvAaBW+fL/sdVJ6l1tAJDJJMHlx15LqhjsPiBAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNzKWpQv7lDfglFx9RxULrTltnsu8Y95y71vG4fAv+0=; b=F+3c2Svg5kuK4Pfs3fRy/Gxx5q
 i70mb7pxDhxJly6Le1KCoRqKxYSsAzc6qMCNLsdEttqzihpqe1ccQaoZqrgo80mytU30YYaDzEOUR
 ZeoXXV8U6i9xDzxXNVp0sSU52CEX9f0MzX0UV6o3aG09MksOKiFsFlp2FiK2wFzVOFVI=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMVFF-0006kZ-Ih for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 17:48:29 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0209440AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1763747304; bh=FNzKWpQv7lDfglFx9RxULrTltnsu8Y95y71vG4fAv+0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RRbxVUNx/GIKSP+OJn6XfoM5lMLekByZsME8PooxFKsO5pOMBzondw4N4k2uslBqP
 oVkpZzhGhmCVx9a+ZoN2iIOlZ1L/ZtUiBgIcqB/YXrgfgMIiq+a9PiHUOcfZlMctcP
 vJzpKR10OV7a3NgBb1QNqx3xaeva9EFuWxUBcVRpFaCuThzOZ1e9uLGwaa7NobSqqB
 UW6WTzv/yrl0HwMADYh9L6ASv/6MnZC5e31Wfdo2V+vMBQp+FdH+VuvkasKTo4eE5S
 ZLN/BAirk4fjm9JM3FEr5Ev6uEjPJo7BpTzGx8crPpvVBRB5pZDkwP4YeMHi32q9fT
 kiWwi7zh0Fg9Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 0209440AD1;
 Fri, 21 Nov 2025 17:48:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
In-Reply-To: <20251117122754.297742-1-nogunix@gmail.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
Date: Fri, 21 Nov 2025 10:48:19 -0700
Message-ID: <87fra7tgyk.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Masaharu Noguchi <nogunix@gmail.com> writes: > Sphinx's LaTeX
 builder fails when converting the nested ASCII tables in > f2fs.rst, producing
 the following error: > > "Markup is unsupported in LaTeX: longtable does
 not support nesting a table." > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vMVFF-0006kZ-Ih
Subject: Re: [f2fs-dev] [PATCH v5] docs: f2fs: wrap ASCII tables in literal
 blocks to fix LaTeX build
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
Cc: nogunix@gmail.com, linux-doc@vger.kernel.org, akiyks@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 bagasdotme@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Masaharu Noguchi <nogunix@gmail.com> writes:

> Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> f2fs.rst, producing the following error:
>
>   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
>
> Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> render them verbatim. This prevents nested longtables and fixes the PDF
> build failure on Sphinx 8.2.x.
>
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Jaegeuk, are you planning to pick this up, or should I take it through
docs?

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
