Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EEBCFF6E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Oct 2025 06:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wRK2ZpeDhlvk6pkuzCicC+739V3rOlqnsIxHk55b7I=; b=lUxVsDApV3geHTEwUnSTVHi4kP
	d/EBPgYUFLo+pf6YuuUw8heRDuEbl2fNBPlWhIiokw3PN4M+ZCuh9eIJZo6qqSS3KMWKfp0hKiFYT
	PmKY9u8g1slXP+ZQywb5WuLqufR9Oa1ETOfykPnf1S/TKcwQOR6eA2CssgZhQ3ySPGu0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7nsM-0003QJ-01;
	Sun, 12 Oct 2025 04:40:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akiyks@gmail.com>) id 1v7nrv-0003Ox-Cc
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 04:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=; b=lE2rAHprvJDyDMQwy4gPXQbsUv
 mwnCel/maSIk2vJ0HBWHxC5XUmQQ7GHHsz0/Ixn5ya10POF9FjqFRUgYRSs0h/pKJ1xYpe8TNWXGW
 7M2sNTSDgoLfX1MOSPbtv9VSlMfVI5PQ5KPZVweYuVO07LhNFoivEd+S2pl0WXo7eFDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=; b=gQQJMX1he+Wni3F+eM2dGwTY/p
 1pFRnZZedNzazOwAAdD630eFGLeWgKAkgLxVGpuETnwb64qcXf0m2sCx6fSdo3bsTqO5xS78D2+8a
 RItJLZSq+7nrhpSGnqcTach/NXOF4cl+I4ZbpmiIV8XvcHnJFS1gHW1VJOJ5Tc5WokHw=;
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v7nru-0000LL-NP for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 12 Oct 2025 04:39:39 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so3053861b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Oct 2025 21:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760243973; x=1760848773; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=;
 b=R9ceSk0WwQkp9WVSmNP8/jHV44DOWf6ePe7+neGmMDeF0D2iLGixqXjQui02hP3jYZ
 et40vXxD2GyaebigAImBiIilYjvgjBJE0LSAfi/38fPb2B3jOFg4xk0leEysXAp0ZnmB
 PhueucJ5Lt/p4uzvEQbktMpo47ykNoWMAgwlh+jl2PbZywxNciIvV/6yCwKL7y+Yx5gp
 EJBvNX2FSDKZQvfGGvbSbkClULhKKFkxjntgNTk/F+UCQDqNBH36aR/mwR1qNSk4MFN4
 jH6k4g8u5x3lJTPdRGJOW70XXOmb2p9UU/nOS01xsYaItFauJjGbyXaEls3fV/qdZaDA
 Serw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760243973; x=1760848773;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DUhac950eRxdyyx3HiUQwDUj821eiw/vdCCJuggJU0=;
 b=GK3GnQSEHT2X+bFwnuOGtrlXvSLOZqPRCQiy+Cu0FnhtxT86+sKEIUJG3yBqOkr+UK
 jjBr6QuvqUxxEXtbMQwAs+NntXNMhD8xb50VF2kqvbtb0bPyf4aU3A/0x607m/r6mW4I
 jOkBgTtxOqIxZOPyV01NfrxOekHdbE7jZ/ffzWvP3l+y9nWJp8QAtKCVkJfjXQJBMxCa
 8VQV5g6XsAFa+ZtWOXVkK82S3zcocmRdgc2UP2CdEQTad3gqZf7ipxsfYNIn6PLc7kWJ
 lq5067POJjLjTkI/thcfjlnyJZdVQbo1AhyoWQ2JEtbbNgVW9rhaSVxZELz3NVXBnxkf
 MKZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX102L0mQ829LJbZGu1F+1s4EheS5DAksbCVEg/8t8V4TQ9mkOqFsTI+TSNApGtgZzFodN0AzmiIn9lFcCmnDM+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxUyzXJhbIll5YdnENcgMzlK0x6L7Gv4IXvUorTURDk015xJTdI
 e2zHwTzckV1uK3/MfYCa5hzXG+KHaRIQwyvpL9kk2pckJvbe7JfUa4smy6e1pA==
X-Gm-Gg: ASbGncuOvBny68kFS/bBffz7hIbCxRtKQDjchWwtMjqPI4Sa+uisQiiMBBl92qA13W+
 dBWLhtQ8bjGl5p8VP0i+iEUL5QAztJHoKB9TDZ50dilkQtbNwuEzD+uXn/yOKHqswFkphb3pqXU
 bW3Xwt4eKHK8/Rv0eVv5OKaVaWn1t8pUI8OgQAwqAyaN8TDBr9gronIEkPIxL5AZYICbpG/6Kd3
 oYHATak7AyKJuIEj1VBxKJP6ZWRnpuSiUpYqd41INunlotDLNoQ/iZER9yJogMH9Lz6D6+z5bWM
 fVHC1Hlcnnx8iulFIxGPTQsPjVGJrcFbFpY1U+PiY09IfalU2+jBISKXDrZ0XWzniwvq4kOu5OZ
 os5T/2BDcKYmJrw3xVvzxgkIICXICvvREUWY6EZBEQ+79w7cqrD5o+UCCOXGfL86dELn1wXHnNr
 aHiG+QZ+S6JO0=
X-Google-Smtp-Source: AGHT+IEVrJIqHvqdRDlLJG5jsbGyIWUy4NaEqCqD107094NHNTnFue4xGwAElpPMyo9ce8seoro+QQ==
X-Received: by 2002:a05:6a00:1701:b0:78c:a3a6:a1bf with SMTP id
 d2e1a72fcca58-79397b19445mr19301172b3a.7.1760243972914; 
 Sat, 11 Oct 2025 21:39:32 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b639cbcsm7453159b3a.18.2025.10.11.21.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Oct 2025 21:39:32 -0700 (PDT)
Message-ID: <12aa7858-b05b-415f-a76b-c18848a9a784@gmail.com>
Date: Sun, 12 Oct 2025 13:39:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nogunix@gmail.com
References: <20251011172415.114599-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251011172415.114599-1-nogunix@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Sun, 12 Oct 2025 02:24:15 +0900, Masaharu Noguchi
 wrote: > Sphinx LaTeX builder fails with the following error: > > Markup
 is unsupported in LaTeX: > filesystems/f2fs:: longtable does not support n
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [akiyks(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1v7nru-0000LL-NP
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
Cc: corbet@lwn.net, Akira Yokosawa <akiyks@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Sun, 12 Oct 2025 02:24:15 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the ASCII tables in literal code blocks so that they are rendered
> as code instead of interpreted as tables. This fixes pdfdocs build
> failure.
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

With this patch applied,
"make SPHINXDIRS=filesystems htmldocs" emits following new warnings (Sphinx 8.2.3):

-------- -------- -------- -------- -------- -------- -------- --------
<srctree>/Documentation/filesystems/f2fs.rst:307: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:308: ERROR: Malformed table.
No bottom table border found.

=========      =========== [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:309: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:310: ERROR: Unexpected indentation. [docutils]
<srctree>/Documentation/filesystems/f2fs.rst:311: ERROR: Malformed table.
No bottom table border found.

=========      =========== [docutils]
-------- -------- -------- -------- -------- -------- -------- --------

That said, for your info, in-development Sphinx 8.3.0 (not yet released)
has a lot of improvements in its latex builder including support of these
nested tables [1].

So, I think one option for you might be to wait Sphinx 8.3.0 without
these changes.

One caveat is that docutils 0.22.x is not fully compatible with the latex
builder at the moment.  If you'd like to test Sphinx 8.3.0, you need to
say "docutils<0.22" in pip install.

[1]: https://www.sphinx-doc.org/en/master/changes/index.html#release-8-3-0-in-development

Hope this helps,
Akira



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
