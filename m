Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AAA68A17B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 19:20:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO0fT-0003uQ-OC;
	Fri, 03 Feb 2023 18:20:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1pO0fS-0003uK-CB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 18:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IVDJzsJUnCAcEMEmSLL1dt196xAYMs/0LWkqLtUvGEo=; b=hsoXQ05WhynVU8vF0hMt0/g/tt
 k/05beSYwJZpKgvG8DNC1yIKovSIRONUQWBGbtdUcX15KIyZMU5raVSmj74t7VDKYKYI8uLOU5kqr
 e6xMddErPJ+XRf1i0j9/zAXCXL/I4GnS3CLgpNeAgiZJkO6vu0YKPv3/uryPNowe127Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IVDJzsJUnCAcEMEmSLL1dt196xAYMs/0LWkqLtUvGEo=; b=BYtdN5cFM9nzOTy/gw8uPkQhss
 FY94bi5RUdczpxNam79lyFK21G4MrppNI5vUoqJOdF6XBlVJNQG31Qjc9yW0Ew2JFNixQQGTPIPd5
 rxdUZONXCN4LwVs9Q+E8+KtwlyXHCRF6GVKlGS9BWVgE587EhYq63hR0BG/Zld+cxhb4=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pO0fQ-00087f-5O for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 18:20:09 +0000
Received: by mail-pj1-f53.google.com with SMTP id m11so5875681pji.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Feb 2023 10:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=IVDJzsJUnCAcEMEmSLL1dt196xAYMs/0LWkqLtUvGEo=;
 b=kdRIA05rAAC19fkietGOxycCuZIno6yjvx1SFT/+o28dhYlh4hl1Lr9PAOYpkahyxz
 iJHGmJQK6PErKv89CynOVzGX39fiB96ONdaomtRNNKWWXTDKbs/vVYdvFYip8zrpsA1X
 Dnfqy4oNZ72o/xXtbYUSIg6z0giUg25im8UDzZrYEGvZDleUFPRelepYXGc1tiydIiMj
 cLK4F21p92luasoaRFLFeay9p/s+uPDxGMW4UaXG32J+wW6tbyRMJ9/0E3n0lYKu3CsG
 bxpYYf9gkYGojovE/IlQ/1NYNTb06sM21upjUtRXD5ML3pz6QV5QGsQ7I0d9R/b0NCq8
 EQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVDJzsJUnCAcEMEmSLL1dt196xAYMs/0LWkqLtUvGEo=;
 b=smyuu3sRi8Te3XflVJQ7wqvHFaBeyEpfpgcQYDWjRgd8WJW58ERRqScUsUEq4S+kmh
 ZwY59oS2D0505XkvcTiDZHPQdzRGsbicQI/oT75o8p/od/o4ZO0jxoufUcAryMFX4FBt
 wyC7BmtFQEIF+eIsyQQHHBbwnT1XYxI66Q/s8d95QYxl44CW1fhg3j5MvDTFps6yHJ1I
 rCUqwxtaECZ6acCtzrDFi1aFhsWaVRx9Yuoq5JKpTOTRbC048GRX22oiRnzftCWJVITn
 C6LcYJBJ3vMBCtKHptIWCcrzkL3ZlQ8IwNiTLDFeE8CF0b/y6xHGfFA6HXKCIdIQ1YOe
 kohw==
X-Gm-Message-State: AO0yUKXcbIcQNKoRBEast1RnTKMdrrRJyQ3NnxE35Tiw+WuCjGUVcoGY
 qC4oqmhwgMDZdZfSMGM0Lxk=
X-Google-Smtp-Source: AK7set8KWOhNAuduyHHtTkMAFypSCaOCENLdIxVTHb1PgH3y0+Y+cEpM++i7M/VJly2PAzBZcvL6yA==
X-Received: by 2002:a17:902:f0cd:b0:195:f3d5:beb0 with SMTP id
 v13-20020a170902f0cd00b00195f3d5beb0mr8818755pla.64.1675448403097; 
 Fri, 03 Feb 2023 10:20:03 -0800 (PST)
Received: from localhost
 (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com.
 [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b00194b3a7853esm1892297plm.181.2023.02.03.10.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:20:02 -0800 (PST)
Date: Fri, 3 Feb 2023 08:20:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y91QUXMfgYx3BrA7@slm.duckdns.org>
References: <20230203010239.216421-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203010239.216421-1-ebiggers@kernel.org>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 02, 2023 at 05:02:39PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > When writing a page from an
 encrypted file that is using > filesystem-layer encryption (not [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pO0fQ-00087f-5O
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix cgroup writeback accounting with
 fs-layer encryption
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 02, 2023 at 05:02:39PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When writing a page from an encrypted file that is using
> filesystem-layer encryption (not inline encryption), f2fs encrypts the
> pagecache page into a bounce page, then writes the bounce page.
> 
> It also passes the bounce page to wbc_account_cgroup_owner().  That's
> incorrect, because the bounce page is a newly allocated temporary page
> that doesn't have the memory cgroup of the original pagecache page.
> This makes wbc_account_cgroup_owner() not account the I/O to the owner
> of the pagecache page as it should.
> 
> Fix this by always passing the pagecache page to
> wbc_account_cgroup_owner().
> 
> Fixes: 578c647879f7 ("f2fs: implement cgroup writeback support")
> Cc: stable@vger.kernel.org
> Reported-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
