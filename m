Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C709365EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Apr 2021 19:43:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lYuPY-00019x-LC; Tue, 20 Apr 2021 17:43:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <salvatore.bonaccorso@gmail.com>) id 1lYuPW-00019d-PZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 17:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0r7+oPVQUGjxLf8FALe8TJW9eBm5+3uLrgjVhTfye+4=; b=SX7S+l6X/8AZIUmWABtxX56tLu
 1PGI9GNhGvQlREZMLWkWn/bpe6G3sF0hReWgX+Aj6S672tjPedm70WgpO3/e5l0KG6QfSOuJ0+a55
 5eXxPoFfYsc6lgVuBwvp67X3V1k4OsVrgLeZ6GZ62OJUXPD0DEeAOh50OcvX1muGXh7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0r7+oPVQUGjxLf8FALe8TJW9eBm5+3uLrgjVhTfye+4=; b=aLtrWqz3/vpCLOuugQFjMj/MnW
 MjWp9Npz19cdTNigezXBG8fXfW2k6INTfDLcjlqbGMli2ke9goO2QxvUPyvYBv7GgravLX/QFxMfc
 NHsuLLxwxAbeHBU1Rp87aaVGPbQc5CtHvuSYUUJ3uqsn2j26op3BbQAGcKn5gDhc4cI8=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lYuPN-003u81-E3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Apr 2021 17:43:42 +0000
Received: by mail-ed1-f43.google.com with SMTP id h10so46074694edt.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Apr 2021 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0r7+oPVQUGjxLf8FALe8TJW9eBm5+3uLrgjVhTfye+4=;
 b=BSG5H33CgJoTATLJlnioz9ao30qBfE7WRCscMQdJBhyGJMHRruINfUieQJIIXsD6Kt
 vFO96MKEBJrKKDSnjPwCn2LyIrczEC3lxRXb1dJoSrObxjuGrysHSWbOzCNw/uj61dQr
 FKAAyWQYVuuQiA+PYNgFoY2XmXy8vxiSXufXQb1JCNMmI8I75XQdeuZSzZob+Dw6elqT
 7gWqS62LucKyEwGTWhY23SYyrwm3sfFfz+yzxHm72SxZDrp/U6Nb+RuwvOlmeqosRtox
 0SbfU0cpDhcoBbKSH1+8lWUmElWozKwVVCdDw5oPG8BTB2icPGeMNW+fF3MoSJ5k+OIT
 DZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=0r7+oPVQUGjxLf8FALe8TJW9eBm5+3uLrgjVhTfye+4=;
 b=IxY+0BsFlLOZiQvBc/xOwTy2sPnM1xR8HxuaB2ixqqZY5K7LMd1kggPInEq+mesFbY
 jd6TvoSywqvYuxbjPQoSvLE5Soz0GHLR6uI+Qe3MooKvGo/xcIgKR6ujy01UBKpPB7Zc
 yGqfJrKwJdLK/UL78xTojFnEH/UQOmGLOxAaot3ROGTJyz4qhrfk/AtZ6+TolN/Acm3x
 pdxsFsG7trWWzNUZQqXyvV20zcRQANsQLugXIqH55+zaOiSn4hOvLXl+wMtM2XqbW1kB
 IGNc5F17hkkdXiBOvmcIHIlHAPf0VZZi2OeMdzAORNbuR94edJR0liH+Xs6l21ORt4t3
 GvCA==
X-Gm-Message-State: AOAM533aiHlQi1BpqWWRu9M6UVAgGp2l8sRAdGVFc4TX0rzBwMr5EA2A
 3h3KVeqdXF+vrH6XTBIdSxQ3KlpQrYLmYJHI
X-Google-Smtp-Source: ABdhPJwYKW2Za0LBbQ/9FSC6HH15TKXSedEhRXOqcIC+7cERpjoJhxBd+TLdg2To7pSt6opp2MrFqA==
X-Received: by 2002:a05:6402:646:: with SMTP id
 u6mr33526522edx.74.1618940607098; 
 Tue, 20 Apr 2021 10:43:27 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id l9sm12919257ejz.96.2021.04.20.10.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 10:43:25 -0700 (PDT)
Date: Tue, 20 Apr 2021 19:43:24 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YH8SvK+OLSKAEYpJ@eldamar.lan>
References: <20210322114730.71103-1-yuchao0@huawei.com>
 <CAFcO6XMak8GSRqQbZ3nPdGvV_eM6DL0+P0z1X2y0G9hkrccaCg@mail.gmail.com>
 <beff8953-d91a-c677-f50a-3aba27c15dde@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <beff8953-d91a-c677-f50a-3aba27c15dde@huawei.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (salvatore.bonaccorso[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1lYuPN-003u81-E3
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-bounds memory
 access
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
Cc: butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Tue, Mar 23, 2021 at 02:43:29PM +0800, Chao Yu wrote:
> Hi butt3rflyh4ck,
> 
> On 2021/3/23 13:48, butt3rflyh4ck wrote:
> > Hi, I have tested the patch on 5.12.0-rc4+, it seems to fix the problem.
> 
> Thanks for helping to test this patch.

Was this patch applied? I do not see it in mainline (unless
miss-checked).

Regards,
Salvatore


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
