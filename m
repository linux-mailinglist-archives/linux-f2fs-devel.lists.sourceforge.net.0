Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADB6865DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 13:23:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNC90-0006bM-UG;
	Wed, 01 Feb 2023 12:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pNC8z-0006b5-8T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 12:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3TmW+83D4k+IrbCdYMzXDO8Tj9MpJav0XaxfanWpefQ=; b=dQTUXYowHbOU1atUblsS54yI/E
 zAM9WkkKbzY4TDCS1KkE26hG9Ac4YWqffPRPiCM2ar5dTVPIfikL3GjIp/N60el2fLz1XXBpYsZuc
 9IToz71sVHtgvVO9YQ00PeqjOTqAvG0zeNc8zWTAYWdayPi962dJQQt5kgnXrOsvIui4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3TmW+83D4k+IrbCdYMzXDO8Tj9MpJav0XaxfanWpefQ=; b=KWHhweRfutpUDPe87olzpjVmCw
 9zECsSP7w1dTvIlD4bWweCkZZhqsmqZhZvoSREsYbeKBFUwuBSTE7qrIAgO44tsml8yphm2BSwxrG
 LsK/pI1Sugw0q2FlXV75XcIL++Dt7AOqRn6ldycL1eY2KoSJIJ/eO4iozqq0z26MLowY=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pNC8x-007GRo-Tg for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 12:23:16 +0000
Received: by mail-pl1-f175.google.com with SMTP id b5so11014494plz.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Feb 2023 04:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3TmW+83D4k+IrbCdYMzXDO8Tj9MpJav0XaxfanWpefQ=;
 b=I5U/ro+QsRr0QjuYf4lEaPFcjn4T3ultNGoWwNM7VxnllmLJJM43O/A4EdK78c+gYN
 LD/yvPN0BMxT3Oct4S9gm14T9/ahFXkBF3DHOsuE+R+5dn8oIt/L2GVdV+Opeu2UQUmI
 XSmYtsktQ9oDE/OvCXFlb5YPxFqMkbbEz/0joqxrGGrZ1UnbStCp3qNFcFuRGs8TiFxn
 UQU3ml3wD8Y5U+Jln9RnOKi9prgJbiyt11WYS5L/ucSRfn05PaCobkFwfVwxARpNC1Pu
 4BdqDWyvdbhktsDDxA7XthNi8u2A4KOD2vj+aWfujnMB0tR0Gp75JTZ6P7a9Xsz/ryzW
 QVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TmW+83D4k+IrbCdYMzXDO8Tj9MpJav0XaxfanWpefQ=;
 b=fDucM/375VmtlgFK6vcLuiSAT2wfMvznh2OTkyWtzXhjgqWYlKAQEVD3ZUung5OEdf
 v1tWBljKfrAmjhgTDRfEx04HnmmI5JBIQqoCeXBqaJkxwoJCK1NC4DIO2kMNNXBcDcWM
 4EU1Dnjt8K4yFj9DFyXFuOEE/PdNzA4Fk98cC4ILDMblYRYEjc0nQ9AytxTpxpxjI/7X
 XWszbMxZ7L10BOp98QKZFhQ1E9Pswp+ePswIEyOcQk8Hw2yKfKMT5IJL6K/Net0/7CdF
 iuECLzTTp44/aJtNtnJt1CI3hpbyUMRUCvFHBkEN5+re5KEoptzQnCp5pdYn6/uMeEBu
 NXig==
X-Gm-Message-State: AO0yUKWdy+roxpAHTY+NWBD1eVBsYye8gKw5491AFQ1V1JLnqH3so9aT
 i/qbDaidRm+q+OkMEGawDVE=
X-Google-Smtp-Source: AK7set9lOEgQz/SUAUmSfBUuhQJpbhyySXachWSl8MnURgyFYlXm/kqYjHVG4Os61imcmeur3J0G0w==
X-Received: by 2002:a17:902:ea12:b0:196:6297:bbc2 with SMTP id
 s18-20020a170902ea1200b001966297bbc2mr2907338plg.58.1675254190327; 
 Wed, 01 Feb 2023 04:23:10 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902c74500b00195f0fb0c18sm11745867plq.31.2023.02.01.04.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 04:23:09 -0800 (PST)
Date: Wed, 1 Feb 2023 20:23:04 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Y9pZqOMBipT2NZk0@mi-HP-ProDesk-680-G4-MT>
References: <20230113125859.15651-1-qixiaoyu1@xiaomi.com>
 <20230116030850.20260-1-qixiaoyu1@xiaomi.com>
 <7c12ebaa-4d3d-e475-dfb2-7b459cd26e64@kernel.org>
 <Y9ZWDVV3HJ431Fis@mi-HP-ProDesk-680-G4-MT>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9ZWDVV3HJ431Fis@mi-HP-ProDesk-680-G4-MT>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > > > How about updating as below to avoid lossing accuracy
 if new is less than 100? > > > > return div_u64(new * (100 - LAST_AGE_WEIGHT), 
 100) + > > div_u64(old * LAST_AGE_WEIGHT, 100); > > > > Tha [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pNC8x-007GRo-Tg
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: fix wrong calculation of block
 age
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > 
> > How about updating as below to avoid lossing accuracy if new is less than 100?
> > 
> > return div_u64(new * (100 - LAST_AGE_WEIGHT), 100) +
> > 		div_u64(old * LAST_AGE_WEIGHT, 100);
> > 
> > Thanks,
> > 
> 
> We want to avoid overflow by doing the division first. To keep the accuracy, how
> about updating as below:
> 
> 	res = div_u64_rem(new, 100, &rem_new) * (100 - LAST_AGE_WEIGHT)
> 		+ div_u64_rem(old, 100, &rem_old) * LAST_AGE_WEIGHT;
> 	res += rem_new * (100 - LAST_AGE_WEIGHT) / 100 + rem_old * LAST_AGE_WEIGHT / 100;
> 	return res;
> 
> Thanks,
> 

Friendly ping

> > >   }
> > >   /* This returns a new age and allocated blocks in ei */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
